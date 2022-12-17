import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ShootingStar",
    product: .app,
    packages: [
        .SnapKit,
        .Then,
        .RxSwift,
        .RxFlow,
        .RxDataSources,
        .Swinject,
        .FirebaseAuth,
        .Tabman
    ],
    dependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.RxSwift,
        .SPM.RxFlow,
        .SPM.RxDataSources,
        .SPM.RxCocoa,
        .SPM.Swinject,
        .SPM.FirebaseAuth,
        .SPM.Tabman
    ],
    resources: ["Resource/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
