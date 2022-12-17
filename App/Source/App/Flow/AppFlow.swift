//
//  AppFlow.swift
//
//
//  Created by baegteun on 2021/11/30.
//

import RxFlow
import RxRelay
import RxSwift
import UIKit

struct AppStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    var initialStep: Step{
        return AppjamStep.onBoardingIsRequired
    }
}

final class AppFlow: Flow{
    
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    private lazy var rootVC: UIViewController = {
        let launchScreenStoryboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let launchScreen = launchScreenStoryboard.instantiateViewController(withIdentifier: "LaunchScreen")
        return launchScreen
    }()
    
    // MARK: - Init
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asAppJamStep else { return .none }
        
        switch step{
        case .onBoardingIsRequired:
            return coordinateToOnBoarding()
        case .mainIsRequired:
            return coordinateToClubList()
        default:
            return .none
        }
    }
}

// MARK: - Method

private extension AppFlow{
    func coordinateToOnBoarding() -> FlowContributors {
        let flow = OnBoardingFlow()
        Flows.use(
            flow,
            when: .created
        ) { [unowned self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.async {
                self.rootVC.dismiss(animated: false)
                self.rootVC.present(root, animated: true)
            }
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: flow,
            withNextStepper: OneStepper(withSingleStep: AppjamStep.onBoardingIsRequired)
        ))
    }
    func coordinateToClubList() -> FlowContributors {
        let flow = MainFlow()
        Flows.use(
            flow,
            when: .created
        ) { [unowned self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.async {
                self.rootVC.dismiss(animated: false)
                self.rootVC.present(root, animated: true)
            }
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: AppjamStep.mainIsRequired)
            ))
    }
}
