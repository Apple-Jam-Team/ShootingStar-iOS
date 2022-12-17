import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ShootingStar",
    product: .app,
    packages: [
        .SnapKit,
        .Then,
        .RxSwift,
        .RxDataSources,
        .FirebaseAuth,
    ],
    dependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.RxSwift,
        .SPM.RxDataSources,
        .SPM.RxCocoa,
        .SPM.FirebaseAuth,
    ],
    resources: ["Resource/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
