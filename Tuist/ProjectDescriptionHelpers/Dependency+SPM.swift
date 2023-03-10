import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxCocoa = TargetDependency.package(product: "RxCocoa")
    static let RxDataSources = TargetDependency.package(product: "RxDataSources")
    static let FirebaseAuth = TargetDependency.package(product: "FirebaseAuth")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift",
        requirement: .upToNextMajor(from: "6.5.0")
    )
    static let RxDataSources = Package.remote(
        url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
        requirement: .upToNextMajor(from: "5.0.2")
    )
    static let FirebaseAuth = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk",
        requirement: .upToNextMajor(from: "10.3.0")
    )
}
