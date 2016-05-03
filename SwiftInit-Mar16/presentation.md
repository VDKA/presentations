## Swift Initialization Patterns

---
# Implicitly Unwrapped properties

- Unsafe when misused
- Required to be mutable
- Initialization and Declaration are separated

---
# Computed Properties

- Is immutable, despite `var` declaration
- Initialization is with Declaration

---
# Issues

Each access calls the closure that created the tableView. This results in receiving a new object upon every call

---
# Self invoking closures

- Is immutable
- Initialization is with declaration
- Initialized along with `self` is initialized. This is fine for most use cases

---
# Issues

```swift
class ViewControllerSubclass: UIViewController {
	let tableView: UITableView = {
		let tv = UITableView(frame: self.view.frame, style: .Grouped)
		return tv
	}()
}
```

`error: value of type 'NSObject -> () -> ViewControllerSubclass' has no member 'view'`

---
The closure does not capture `self`

---
# Self invoking closures declared as `lazy var`

- Initialization is with declaration
- Use of `lazy` guarantees self will be initialized when accessed

---
# Mutability

```swift
private(set) lazy var tableView: UITableView = {
	let tv = UITableView(frame: self.view.frame, style: .Grouped)

	return tv
}()
```

---
## Why is this useful?

---
```swift
lazy var locationManager: CLLocationManager = {
	let manager = CLLocationManager()
	manager.desiredAccuracy = kCLLocationAccuracyBest
	manager.delegate = self
	manager.requestAlwaysAuthorization()
	return manager
}()
```

---
# Then[^1]

[^1]:https://github.com/devxoul/Then

---
then is a µFramework that makes expressing your intent slightly clearer.

---
```swift
import Foundation

public protocol Then {}
extension Then {

    public func then(@noescape block: inout Self -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }

}

extension NSObject: Then {}
```

---
## Then uses the Self invoking closures Method

```swift
let label = UILabel().then {
    $0.textAlignment = .Center
    $0.textColor = .blackColor()
    $0.text = "Hello, World!"
}
```

Equivalent to

```swift
let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .Center
    label.textColor = .blackColor()
    label.text = "Hello, World!"
    return label
}()
```

---
Questions?
