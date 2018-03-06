
# Cocoaheads

---

## Update Your Product Page for the 
## All-New App Store

<br>

developer.apple.com/app-store/product-page/

---

# App Preview Videos

These are the hero banners of the app store

![right fit autoplay mute](SlopesAppStore.mp4)


^
Videos now autoplay so most people will watch your videos without sound

^
https://applaunchmap.com/2017/06/23/why-app-preview-videos-are-vital-in-ios-11

---

# Fastlane Precheck

- No other platforms are mentioned in the description
- There are no curse words in your copy
- No placeholder text is left
- No URLs are broken

^
https://fabric.io/blog/introducing-fastlane-precheck

---

## Arduinos with HomeKit

^
used to be hurdles you'd have to jump through just to tinker with it

^
You still need official certification to be able to sell these devices

^
https://www.theverge.com/2017/6/8/15761800/apple-homekit-updates-ios-11-easier-build-requirements-wwdc-2017

---

## artemnovichkov/iOS-11-by-Examples

^
https://github.com/artemnovichkov/iOS-11-by-Examples

---

## SwiftPM manifest api redesign

```swift
// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "cte",
    dependencies: [
       .package(url: "https://github.com/vdka/LLVMSwift.git", .branch("comparisons-are-binary")),
    ],
    targets: [
        .target(name: "cte", dependencies: ["LLVM"]),
    ],
    swiftLanguageVersions: [4]
)
```

^
Save yourself the pain

^
https://swift.org/blog/swift-package-manager-manifest-api-redesign

---

## Codable

> Turns out if you go deep enough, it’s Objective-C all the way down.

- @gregheo

^
1. Array, encode yourself to `_JSONEncoder`
2. Array sets up unkeyed container (NSMutableArray storage)
3. Array iterates over all elements and encodes them
  - Integer, encode yourself to `_JSONEncoder`
  - Integer sets up single-value container
  - Integer asks the container to encode itself
    - Container boxes the integer into `NSNumber`, adds to the array
4. Use JSONSerialization to encode the top-level `NSMutableArray`

[^1]: https://swiftunboxed.com/stdlib/json-encoder-encodable

---

### Ultimate Guide to JSON Parsing with Swift 4

```swift
struct Beer : Coding {
    // ...
    let createdAt: Date
    let bottleSizes: [Float]
    let comments: String?

    enum CodingKeys: String, CodingKey {
        // ...
        case createdAt = "created_at",
        case bottleSizes = "bottle_sizes"
        case comments
    }
}
```

^
I have completely converted to Swift4 Codable API... It's ok..

^
http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4

---

## madewitharkit.com

![right autoplay mute](https://www.youtube.com/watch?v=rIPfpGCxONQ)

---

![fit autoplay mute](https://www.youtube.com/watch?v=z7DYC_zbZCM)

^
Not just fun and games

---

## ahmetws/UnsplashExplorer-CoreML

CoreML for image classification

![right fit](68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f7a4e764f41684d7450616c77492f67697068792e676966.gif)

^
https://github.com/ahmetws/UnsplashExplorer-CoreML

---

### `fastred/DeallocationChecker`

```swift
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    dch_checkDeallocation()
}
```

^
https://github.com/fastred/DeallocationChecker

^
Useful because swift closures make reference cycles incredibly easy to have slip in
After all, a swift closure can implicitly strongly capture self

