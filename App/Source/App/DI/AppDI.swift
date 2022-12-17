import Swinject
import RxFlow

extension Container{
    func registerDependencies() {
        registerVC()
    }
    
    private func registerVC() {
        self.register(OnBoardingVC.self) { r in
            return OnBoardingVC(viewModel: r.resolve(BaseViewModel.self)!)
        }
    }
}
