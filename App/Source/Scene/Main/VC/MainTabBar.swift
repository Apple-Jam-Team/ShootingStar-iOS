import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainVC = MainVC(viewModel: .init())
        let myPageVC = MyPageVC(viewModel: .init())

        self.setViewControllers([mainVC, myPageVC], animated: false)

        guard let items = self.tabBar.items else { return }

        let images = ["house.fill", "person.fill"]

        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }

        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
    
}
