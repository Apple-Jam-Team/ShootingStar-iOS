import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let voteVC = VoteVC(viewModel: .init())
        let mainVC = MainVC(viewModel: .init())
        let myPageVC = MyPageVC(viewModel: .init())

        self.setViewControllers([mainVC, voteVC, myPageVC], animated: false)

        guard let items = self.tabBar.items else { return }

        let images = ["house.fill", "tray.and.arrow.down.fill", "person.fill"]

        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }

        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
    
}
