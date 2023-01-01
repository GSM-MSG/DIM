# DIM

Dependency injection library for Swift

[Document](https://gsm-msg.github.io/DIM/documentation/dim/)

<br>

## Contents
- [DIM](#dim)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Communication](#communication)
  - [Installation](#installation)
    - [Manually](#manually)
  - [Usage](#usage)
    - [Quick Start](#quick-start)

<br>

## Requirements
- iOS 13.0+ / tvOS 13.0+ / watchOS 7+ / macOS 12.0+
- Swift 5+
  
<br>

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.

<br>

## Installation
[Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `DIM` into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/GSM-MSG/DIM.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate DIM into your project manually.

<br>

## Usage

### Quick Start
```swift
import DIM

protocol ExProtocol {
    func doSomething()
}

struct ExStruct: ExProtocol {
    func doSomething() {
        print("doSomething")
    }
}

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication, 
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        DIMContainer {
            Injection(ExProtocol.self) { ExStruct() }
        }.build()
        return true
    }
}

final class ViewController: UIViewController {
    @Injected var ex: ExProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        ex.doSomething() // doSomething
    }
}

```