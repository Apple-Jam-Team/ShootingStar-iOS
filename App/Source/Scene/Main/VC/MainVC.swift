import UIKit
import Tabman
import Pageboy

class MainVC: TabmanViewController {

    private var viewControllers: [UIViewController] = []
    private let myPageButton = UIBarButtonItem(image: .init(systemName: "person.circle"))
    private let newClubButton = UIBarButtonItem(image: .init(systemName: "plus.app"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onBoardingVC = OnBoardingVC(viewModel: .init())
        let two = Two(viewModel: .init())
        
        viewControllers.append(onBoardingVC)
        viewControllers.append(two)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.tintColor = .black
        bar.layout.interButtonSpacing = 90
        bar.buttons.customize {
            $0.tintColor = .blue
        }
        bar.indicator.weight = .custom(value: 0)
//        bar.buttons.customize {
//            $0.font = .systemFont(ofSize: 14)
//            $0.tintColor = ShootingStarAsset.Colors.main.color
//            $0.selectedFont = .systemFont(ofSize: 15)
//            $0.selectedTintColor = UIColor(red: 0, green: 0.65, blue: 1, alpha: 0.99)
//        }
//        bar.layout.alignment = .centerDistributed
        bar.systemBar().backgroundStyle = .clear
        addBar(bar, dataSource: self, at: .bottom)
    }
}

extension MainVC: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .first
    }
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
            case 0:
            let item = TMBarItem(title: "123")
            return item
            case 1:
                return TMBarItem(image: .init(systemName: "person.circle") ?? .init())
            case 2:
                return TMBarItem(image: .init(systemName: "person.circle") ?? .init())
            default:
            return TMBarItem(title: title ?? "")
            }
    }
}
