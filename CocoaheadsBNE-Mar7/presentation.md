# Cocoaheads

---

## Playgroundscon

Great talks which will be available some time in the future on skilled.io

playgroundscon.com

---

## WWDC 2017

^ McEnery Convention Center, San Jose

^ Registration opens Monday, March 27

![](WWDC2017.png)

---

## MacOS 10.12.4

- Night Shift

---

## Xcode 8.3

Less bugs.

---

## Swift 3.1

```
extension Array where Element == Int { }
```
```
struct OuterNonGeneric {
 struct InnerGeneric<T> {}
}
struct OuterGeneric<T> {
 struct InnerNonGeneric {}
 struct InnerGeneric<T> {}
}
extension OuterNonGeneric.InnerGeneric {}
```

---

## Swift 4.0 Release Process

This will be quite similar to Swift 3.0.

The largest difference between 2 -> 3 and 3 -> 4 will be **source compatibility**.

---

# :tada:

---

## Articles of Interest

---

## Getting to Swift 3 at AirBnB

https://medium.com/airbnb-engineering/getting-to-swift-3-at-airbnb-79a257d2b656

---

## Migrating Firefox for iOS to Swift 3.0

^ Includes a useful list of what caused compiler segfaults during.

Worth noting is that the Firefox app is all open source.

https://github.com/mozilla-mobile/firefox-ios
https://mozilla-mobile.github.io/ios/firefox/swift/core/2017/02/22/migrating-to-swift-3.0.html

---

## Swift Changes Considered Harmful

Mentions Sample code from October 2016 for Xcode 8 that doesn't compile and the difficulty for a beginner to pick up with so misleading and unhelpful samples around.

http://furbo.org/2017/02/17/swift-changes-considered-harmful/

---

## Reduced Stdlib size

![inline](SmallerStdlib.png)

---

## Bridging From Swift to ObjC

If you are writing both alongside one another. This may help.

http://blog.benjamin-encz.de/post/bridging-swift-types-to-objective-c/

---

## Swift Ownership Manifesto

Rust style borrow checker, non ARC code made simple? Really this document describes a dedication from Apple to pushing Swift onto as many problem domains as possible.

https://github.com/apple/swift/blob/master/docs/OwnershipManifesto.md

---

## That One Optional Property

```swift
// from this
var notificationMessage: String?

// to this
enum Mode {
    case fromNotification(message: String)
    case normal
}

var mode: Mode
```

^ Article by Soroush Khanlou

^ Talks about the clarity of using your own enum type rather than using the less contextually clear Optional type

^ ask yourself, what does this optional really mean? Is there a better way to represent this data?

^ Also yes to nested types

http://khanlou.com/2017/03/that-one-optional-property/

---

## Effective use of shadows and blurring

A discussion on how, when and why to use these effects in your UI's

https://www.smashingmagazine.com/2017/02/shadows-blur-effects-user-interface-design/

---

## Open Source

---

## Hydra (Promises)

^ Javascript in Swift

```swift
func getImage(url: String) -> Promise<UIImage> {
    return Promise<UIImage>(in: .background, { resolve, reject in
        self.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                reject(error)
            } else if let data = data, let response = response as? HTTPURLResponse {
                resolve((data, response))
            } else {
                reject("Image cannot be decoded")
            }
        }).resume()
    })
}
```

https://github.com/malcommac/Hydra

---

## Guitar Cross Platform String Library

Includes:
- Casing manipulation
- `reverse`, `length`, `first`, `last`
- trimming
- truncating...
- `left-pad` (and others)

https://github.com/ArtSabintsev/Guitar

---

## PanelKit

^ Does modal, popover, floating and pinned panelling for you

![inline](PanelKit.gif)

https://github.com/louisdh/panelkit

---

## ElongationPreview

Push Pop style View Controller

![inline](ElongationPreview.gif)

https://github.com/Ramotion/elongation-preview

---

## SwipeCellKit

![inline](SwipeCellKit.gif)

https://jerkoch.com/2017/02/07/swiper-no-swiping.html
https://github.com/jerkoch/SwipeCellKit

---

## Twitter Image Pipeline

Blog post and Open Source Framework built for loading and caching images in the Twitter app.

https://blog.twitter.com/2017/introducing-twitter-image-pipeline-ios-framework-for-open-source
https://github.com/twitter/ios-twitter-image-pipeline

---

## Benchmarking made better

![inline](Attabench-screenshot.png)

https://github.com/lorentey/Attabench

---

# Call for speakers

^ We desperately need speakers
Is it valuable to have a list of ideas people can look into
A voting board
Typically we are pretty bad at remembering to do this

^ Next up: Rob talking about Mobile Device Management

---

# Slack

## brisbane.herokuapp.com

^ For anybody not in the slack group
