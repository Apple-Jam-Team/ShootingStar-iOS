import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        let mainViewController = OnBoardingVC(viewModel: .init())
//        let mainViewController = MainTabBar(nibName: nil, bundle: nil)
        let naviMainViewController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = naviMainViewController
        window?.makeKeyAndVisible()
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

