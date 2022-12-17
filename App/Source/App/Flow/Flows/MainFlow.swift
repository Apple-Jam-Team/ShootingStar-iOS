import RxFlow
import RxRelay
import RxSwift
import UIKit

struct MainStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return AppjamStep.mainIsRequired
    }
}

final class MainFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: MainStepper = .init()
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asAppJamStep else { return .none }
        switch step{
        case .onBoardingIsRequired:
            return .end(forwardToParentFlowWithStep: AppjamStep.onBoardingIsRequired)
        case .mainIsRequired:
            return coordinateToMain()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainFlow{
    func coordinateToMain() -> FlowContributors {
        let vc = AppDelegate.container.resolve(MainVC.self)!
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: stepper))
    }
}
