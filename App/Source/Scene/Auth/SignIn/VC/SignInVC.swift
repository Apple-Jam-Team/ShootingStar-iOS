import UIKit
import Firebase
import Then
import SnapKit

class SignInVC: BaseVC<SigninViewModel> {
    private var emailTF = UITextField().then {
        $0.placeholder = "이메일을 입력하세요"
    }
    private var passwordTF = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.isSecureTextEntry = true
    }
    override func configureVC() {
//        view.backgroundColor = .blue
    }
    override func addView() {
        [
            emailTF,
            passwordTF
        ].forEach {
            view.addSubview($0)
        }
    }
    override func setLayout() {
        emailTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        passwordTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTF.snp.bottom).inset(-30)
        }
    }
}
