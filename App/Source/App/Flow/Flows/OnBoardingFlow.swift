import RxFlow
import RxRelay
import RxSwift
import UIKit

struct OnBoardingStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return AppjamStep.onBoardingIsRequired
    }
}

final class OnBoardingFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: OnBoardingStepper = .init()
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
            return coordinateToOnBoarding()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension OnBoardingFlow{
    func coordinateToOnBoarding() -> FlowContributors {
        let vc = AppDelegate.container.resolve(OnBoardingVC.self)!
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: stepper))
    }
}