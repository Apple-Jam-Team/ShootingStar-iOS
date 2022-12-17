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
        .FirebaseAuth
    ],
    dependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.RxSwift,
        .SPM.RxFlow,
        .SPM.RxDataSources,
        .SPM.RxCocoa,
        .SPM.Swinject,
        .SPM.FirebaseAuth
    ],
    resources: ["Resource/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
