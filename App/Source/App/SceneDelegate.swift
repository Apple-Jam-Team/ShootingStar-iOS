import UIKit
import RxSwift
import RxFlow
//import Inject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let disposeBag: DisposeBag = .init()
    private let coordinator: FlowCoordinator = .init()
    
    let appFlow = AppFlow()
    let appStepper = AppStepper()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
            // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
            // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
            guard let c = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: c)
        let controller = MainVC(viewModel: BaseViewModel.init())
           
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
//    func scene(
//        _ scene: UIScene,
//        willConnectTo session: UISceneSession,
//        options connectionOptions: UIScene.ConnectionOptions
//    ) {
//        guard let s = (scene as? UIWindowScene) else { return }
//
//        window = UIWindow(windowScene: s)
//
//        coordinateLogger()
//        coordinateToAppFlow(with: s)
//    }
//
//    private func coordinateToAppFlow(with scene: UIWindowScene){
//        let window = UIWindow(windowScene: scene)
//        self.window = window
//
        
//        coordinator.coordinate(flow: appFlow, with: appStepper)
//        Flows.use(
//            appFlow,
//            when: .created
//        ) { [weak self] root in
//            self?.window?.rootViewController = root
//            self?.window?.makeKeyAndVisible()
//        }
    }
    
    private func coordinateLogger(){
        coordinator.rx.willNavigate
            .subscribe(onNext: { flow, step in
                let currentFlow = "\(flow)".split(separator: " ").last ?? "No Flow"
                print("➡️ will navigate to flow = \(currentFlow) and step = \(step)")
            })
            .disposed(by: disposeBag)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

