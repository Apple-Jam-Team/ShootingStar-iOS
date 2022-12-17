import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxFlow = TargetDependency.package(product: "RxFlow")
    static let RxCocoa = TargetDependency.package(product: "RxCocoa")
    static let RxDataSources = TargetDependency.package(product: "RxDataSources")
    static let Swinject = TargetDependency.package(product: "Swinject")
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
    static let RxFlow = Package.remote(
        url: "https://github.com/RxSwiftCommunity/RxFlow.git",
        requirement: .upToNextMajor(from: "2.13.0")
    )
    static let RxDataSources = Package.remote(
        url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
        requirement: .upToNextMajor(from: "5.0.2")
    )
    static let Swinject = Package.remote(
        url: "https://github.com/Swinject/Swinject",
        requirement: .upToNextMajor(from: "2.8.3")
    )
}
