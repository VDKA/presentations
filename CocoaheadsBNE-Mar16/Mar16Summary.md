# Cocoaheads

---
# IBM & Swift

IBM backs Swift.

- Swift Sandbox
- Kitura
- IBM Swift Package Catalog

---
# Hello Server Side Swift
Logan Wright writes about deploying a fully functional server application to Heroku in this [post](https://medium.com/@LogMaestro/server-side-swift-c965b7ebe6e7#.o7qkzg8gq)

---
# Server Side Swift Push

- [Kitura](https://github.com/IBM-Swift/Kitura)
- [Swifton](https://github.com/necolt/Swifton)
- [URLNavigator](https://github.com/devxoul/URLNavigator)
- [Perfect](https://github.com/PerfectlySoft/Perfect)
- [vapor](https://github.com/qutheory/vapor)
- [Zewo](https://github.com/zewo/Zewo)
- [Swiftra](https://github.com/takebayashi/swiftra)
- [Curassow](https://github.com/kylef/Curassow)
- [Redbird](https://github.com/czechboy0/Redbird)
- [Blackfish](https://github.com/elliottminns/blackfish)
- [Nest](https://github.com/nestproject/Nest)

---
# Swift 2.2 / Xcode 7.3 Beta 4

- Selectors are now typed
- Compiler check for swift versions
- function naming with argument labels
- `__line__` & Friends become `#line`
- Fuzzy code complete
- 3D Touch in simulator

---
# Swift Version Manager

`brew install swiftenv`

```
Usage: swiftenv [--version] <command>

  version   Displays the current active Swift version
  versions  Lists all installed Swift versions
  global    Sets the global version of Swift
  local     Sets the local application-specific version fo Swift
  install   Installs a version of Swift
  uninstall Uninstalls a specific Swift version
  rehash    Installs shims for Swift binaries
```

---
# Swift on Raspberry-Pi
> This will work with every RaspberryPi 1 (A,B,A+,B+) and the RaspberryPi Zero. This package is based on the same sources of the ARMv7 build but lacks Foundation, XCTest, LLDB and the REPL.

See [here](https://www.uraimo.com/2016/02/10/swift-available-on-armv6-raspberry-1-zero/)

---
# Swift on Android

Write once run anywhere with Swift?

Perhaps [soon](https://github.com/apple/swift/pull/1442)

---
# Apples Open [Letter](http://www.apple.com/customer-letter/)

---
# What is the Secure Enclave
Mike Ash take us through what the security feature in iPhones from the 5s onwards in his [blog post](https://www.mikeash.com/pyblog/friday-qa-2016-02-19-what-is-the-secure-enclave.html)

---
# Fabric App
[Fabric](https://itunes.apple.com/us/app/id1077938720?mt=8) lets you view crash statistics reported from your app through crashlytics

---
# Peek & Pop [Guide](https://www.natashatherobot.com/peek-pop-view-inside-tableviewcell/)
A detailed experience of implementing these new features in iOS9.

Includes recommendations and the [source code](https://github.com/NatashaTheRobot/trySwiftApp) from the app store for the try! conference app

---
# A DSL for working with Predicates in Swift

if (somewhat) compiler time checked predicates like this

`let pred = NSPredicate("tweets" > 200 && "age" == 18)`

look appealing to you check [this](http://colindrake.me/2015/10/28/implementing-a-small-dsl-in-swift/) out

---
# A different approach to preconditions

[Validated](http://blog.benjamin-encz.de/validated-a-swift-m-library-for-somewhat-dependent-types/) is a small [library](https://github.com/Ben-G/Validated) built around turning this:
```
func performTaskWithUser(user: User) {  
    precondition(user.loggedIn, "not logged in")
    ...
}
```
into this:
```
func performTaskWithUser(user: LoggedInUser) { ... }
```

---
# Swift Algorithms

A lot of data structures and algorithms all in swift [here](https://github.com/hollance/swift-algorithm-club)

---
# Questions?
