import UIKit
import Firebase
import Then
import SnapKit

class SignInVC: BaseVC<SigninViewModel> {
    private let logout = UIButton().then {
        $0.setTitle("임시 로그아웃 버튼", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "ShottingStar")
    }
    private var emailTF = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "이메일을 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var passwordTF = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.isSecureTextEntry = true
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var signinButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "LightBlack")
        $0.layer.cornerRadius = 20
    }
    private var noUserButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        $0.setTitle("아직 회원이 아니십니까? 회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    override func configureVC() {
        view.backgroundColor = UIColor(named: "Main")
        if Auth.auth().currentUser != nil {
            emailTF.placeholder = "이미 로그인 된 상태입니다."
            passwordTF.placeholder = "이미 로그인 된 상태입니다."
            signinButton.setTitle("이미 로그인 된 상태입니다.", for: .normal)
        }
        signinButton.rx.tap
            .subscribe(onNext: {
                Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!) { (user, error) in
                    if user != nil{
                        print("login success")
                        self.navigationController?.pushViewController(MainVC(viewModel: MainViewModel()), animated: true)
                    }
                    else{
                        print("login fail")
                    }
                }
            }).disposed(by: disposeBag)
        noUserButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(SignupVC(viewModel: SignupVM()), animated: true)
            }).disposed(by: disposeBag)
        logout.rx.tap
            .subscribe(onNext: {
                do {
                    try Auth.auth().signOut()
                } catch {
                    print(error.localizedDescription)
                }
            }).disposed(by: disposeBag)
    }
    override func addView() {
        [
            logout,
            emailTF,
            passwordTF,
            titleImage,
            signinButton,
            noUserButton
        ].forEach {
            view.addSubview($0)
        }
    }
    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32)
        }
        emailTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        passwordTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTF.snp.bottom).inset(-15)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        signinButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTF.snp.bottom).inset(-70)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        noUserButton.snp.makeConstraints {
            $0.top.equalTo(signinButton.snp.bottom).inset(-15)
            $0.centerX.equalToSuperview()
        }
        logout.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(noUserButton.snp.bottom).offset(10)
        }
    }
}

//extension
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
 
    func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UIButton {
    func addLeftPadding(_ padding: CGFloat) {
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: -padding)
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: padding)
    }
}
extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
