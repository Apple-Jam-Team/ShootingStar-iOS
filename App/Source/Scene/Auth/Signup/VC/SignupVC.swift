import UIKit
import Firebase
import Then
import SnapKit

class SignupVC: BaseVC<SignupVM> {
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "ShottingStar")
    }
    private var nameTF = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "닉네임을 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
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
    private var checkPasswordTF = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "비밀번호를 재입력해주세요."
        $0.isSecureTextEntry = true
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var showConstellationModalButton = UIButton().then {
        $0.addLeftPadding(24)
        $0.contentHorizontalAlignment = .left
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        $0.setTitle("별자리를 선택해주세요", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var signupButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "LightBlack")
        $0.layer.cornerRadius = 20
    }
    private var alreadyUserButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        $0.setTitle("이미 계정을 가지고 계십니까? 로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    override func configureVC() {
        view.backgroundColor = UIColor(named: "Main")
        signupButton.rx.tap
            .subscribe(onNext: {
                Auth.auth().createUser(withEmail: self.emailTF.text!, password: self.passwordTF.text!
                ) { (user, error) in
                    if user !=  nil{
                        print("register success")
                    }
                    else{
                        print("register failed")
                    }
                }
            }).disposed(by: disposeBag)
        showConstellationModalButton.rx.tap
            .subscribe(onNext: {
//                self.present(ConstellationVC(viewModel: ConstellationVM()), animated: true, completion: nil)
                let vc = ConstellationVC(viewModel: ConstellationVM())
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.large()]
                    
                    //시트 상단에 그래버 표시 (기본 값은 false)
                    sheet.prefersGrabberVisible = true
                    
                    //처음 크기 지정 (기본 값은 가장 작은 크기)
                    sheet.selectedDetentIdentifier = .large
                    
                    //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
                    sheet.largestUndimmedDetentIdentifier = .medium
                }
                
                self.present(vc, animated: true, completion: nil)
            }).disposed(by: disposeBag)
        alreadyUserButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(SignInVC(viewModel: SigninVM()), animated: true)
            }).disposed(by: disposeBag)
    }
    override func addView() {
        [
            nameTF,
            emailTF,
            passwordTF,
            checkPasswordTF,
            showConstellationModalButton,
            titleImage,
            signupButton,
            alreadyUserButton
        ].forEach {
            view.addSubview($0)
        }
    }
    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaInsets).inset(100)
        }
        nameTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleImage.snp.bottom).inset(-80)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        emailTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameTF.snp.bottom).inset(-15)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        passwordTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTF.snp.bottom).inset(-15)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        checkPasswordTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTF.snp.bottom).inset(-15)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        showConstellationModalButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(checkPasswordTF.snp.bottom).inset(-15)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(showConstellationModalButton.snp.bottom).inset(-70)
            $0.leadingMargin.trailingMargin.equalTo(30)
            $0.height.equalTo(50)
        }
        alreadyUserButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signupButton.snp.bottom).inset(-15)
        }
    }
}
