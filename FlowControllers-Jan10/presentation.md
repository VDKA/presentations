# Experimenting with Flow Controllers

---

## The Aim

- should be more type safe
- decouple ViewController's
- should work with Storyboards

---

## Demo

---

## Segues

```swift
class ListViewController: UIViewController {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = self.photos[indexPath.row]
        let cell = (tableView.cellForRow(at: indexPath) as? ImageCell)

        self.performSegue("toDetail", (image, cell?.photo.image))
    }

    /* ... */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch segue.identifer {
        case "toDetail"?:
            guard let destination = segue.destination as? DetailViewController else {
                log.fatal("Unexpected destination during segue \(segue.identifier)")
            }
            guard let (image, placeholder) = sender as? (Unsplash.Image, UIImage?) else {
                log.fatal("Sender was not of the correct type for segue \(segue.identifier)")
            }

            destination.image = image
            destination.placeholder = placeholder

        default: break
        }
    }
}
```

---

- The `ListViewController` must know about the `DetailViewController`
- prepare for segue different preconditions depending on the segue called
- both prepare and perform are performed using strings

---

# It gets worse

```swift
class ListViewController: UIViewController {

    enum Filter {
        case none
        case user(Unsplash.User)
    }

    var filter: Filter = .none {
        didSet {
            self.photos = []
            guard self.view != nil else { return } // Ensures IBOutlet's are initialized
            self.update()
        }
    }

    /* ... */
}

class DetailViewController: UIViewController {

    var image: Unsplash.Image!
    var placeholder: UIImage?

    @IBAction func didPressPhotographer() {
        (self.presentingViewController as? ListViewController)?.filter = .user(image.photographer)
        self.dismiss(animated: true)
    }

    /* ... */
}
```

---

- The `DetailViewController` now knows about the `ListViewController`
    - They must know about each other!
    - What if I want to present a `DetailViewController` from somewhere else?

---

# FlowController

Storyboard compatibility

```swift
protocol FlowController {
    static func from(storyboard: Storyboard) -> Self
}

extension FlowController where Self: UIViewController {
    /// Changes `AppDelegate.rootViewController` to a new instance of `Self` initialized form the storyboard provided
    static func makeRootViewController(from storyboard: Storybaord) -> Self { /* ... */ }
}
```

---

# DashboardFlowController

```swift
class DashboardFlowController: UINavigationController, FlowController {

    // Called by UIKit when initializing a ViewController from a Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let dashboardViewController = (self.topViewController as? DashboardViewController)

        dashboardViewController?.logout = {
            LoginFlowController.makeRootViewController(from: .login)
        }

        dashboardViewController?.onSelect = { [unowned self] image, placeholder in

            let detailViewController = DashboardDetailViewController.from(storyboard: .dashboard)

            self.present(detailViewController, animated: true)
            detailViewController.image = image
            detailViewController.placeholder = placeholder

            detailViewController.onUserSelect = { [unowned self, dashboardViewController] user in
                dashboardViewController?.filter = .user(user)
                self.dismiss(animated: true)
            }

            detailViewController.close = { [unowned self] user in
                self.dismiss(animated: true)
            }
        }
    }
}
```
---

# ListViewController

```swift
class ListViewController: UIViewController {
    var logout: ((Void) -> Void)!
    var onSelect: ((Unsplash.Image, UIImage?) -> Void)!

    @IBAction func didPressLogout() {
        logout()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = self.photos[indexPath.row]
        let cell = (tableView.cellForRow(at: indexPath) as? ImageCell)

        self.onSelect(image, cell?.photo.image)
    }
}
```

---

# DetailViewController

```swift
class DetailViewController: UIViewController {
    var image: Unsplash.Image!
    var placeholder: UIImage?
    var close: ((Void) -> Void)!
    var onUserSelect: ((Unsplash.User) -> Void)!

    @IBAction func didPressPhotographer() {
        self.onUserSelect(self.image.photographer)
    }

    @IBAction func didPressClose() {
        self.close()
    }
}
```

---

# Without Storyboard support

You can write your own initializer!

```swift
// All in code!
class DetailViewController: UITableViewController {

    required init?(coder aDecoder: NSCoder) {
        fatalError("Unimplemented \(#function)")
    }

    var image: Unsplash.Image
    var placeholder: UIImage?
    var onUserSelect: (Unsplash.User) -> Void
    var close: (Void) -> Void

    init(image: Unsplash.Image, placeholder: UIImage?, onUserSelect: @escaping (Unsplash.User) -> Void, close: @escaping (Void) -> Void) {
        self.image = image
        self.placeholder = placeholder
        self.onUserSelect = onUserSelect
        self.close = close

        super.init(style: .plain)
    }
}
```

---

# Pitfalls

- You don't need to think about memory management as much with segues.
    - `[unowned self, dashboardViewController]`
- There is some strange behavior when changing a `UIWindow.rootViewController`
    - This can be avoided by using the `rootViewController`

![](/Users/Ethan/Desktop/Screen Shot 2017-01-09 at 9.32.50 AM.png)
