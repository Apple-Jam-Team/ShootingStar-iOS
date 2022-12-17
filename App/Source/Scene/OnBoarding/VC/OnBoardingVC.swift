import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class OnBoardingVC: BaseVC<OnBoardingViewModel> {

    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "ShottingStar")
    }
    private let goToSignInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = ShootingStarAsset.Colors.lightGary.color
        $0.layer.cornerRadius = 20
    }
    private let goToSignUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = ShootingStarAsset.Colors.lightGary.color
        $0.layer.cornerRadius = 20
    }
    override func configureVC() {
        view.backgroundColor = ShootingStarAsset.Colors.main.color
        goToSignInButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(SignInVC(viewModel: .init()), animated: true)
            }).disposed(by: disposeBag)
    }
    
    override func addView() {
        [
            goToSignInButton,
            titleImage,
            goToSignUpButton
        ].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaInsets.top).inset(134)
        }
        goToSignInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(goToSignUpButton.snp.top).inset(-20)
            $0.leading.equalTo(view.safeAreaInsets.left).inset(65)
            $0.trailing.equalTo(view.safeAreaInsets.right).inset(65)
            $0.height.equalTo(50)
        }
        goToSignUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(196)
            $0.leading.equalTo(goToSignInButton.snp.leading)
            $0.right.equalTo(goToSignInButton.snp.right)
            $0.height.equalTo(50)
        }
    }
}
