import UIKit
import RxSwift
import Then
import SnapKit

class MyPageVC: BaseVC<MyPageViewModel> {
    
    private let userImage = UIImageView().then {
        $0.image = UIImage(named: "Star")
        $0.backgroundColor = .lightGray
        $0.sizeToFit()
        $0.layer.cornerRadius = 140/2
    }
    
    private let nameLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.text = "김성훈"
    }
    
    private let logoutButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "door.right.hand.open"), for: .normal)
    }
    
    private let starLabel = UILabel().then {
        $0.textColor = ShootingStarAsset.Colors.lightGary.color
        $0.text = "양자리"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private let mailImage = UIImageView().then {
        $0.tintColor = .black
        $0.image = UIImage(systemName: "envelope")
    }
    
    private let mailLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "sunghun4777@gmail.com"
    }
    
    private let postImage = UIImageView().then {
        $0.image = UIImage(systemName: "list.clipboard")
        $0.tintColor = .black
    }
    
    private let postLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "3"
    }
    
    private let lineView = UIView().then {
        $0.frame = CGRect(x: 0, y: 100, width: 370, height: 1.0)
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = .init(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
    }
    
    override func configureVC() {
        logoutButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(SignInVC(viewModel: .init()), animated: true)
            }).disposed(by: disposeBag)
    }
    
    override func addView() {
        view.addSubViews(userImage, nameLabel, starLabel, mailImage, mailLabel, postImage, postLabel, lineView, logoutButton)
    }
    
    override func setLayout() {
        userImage.snp.makeConstraints {
            $0.size.equalTo(140)
            $0.top.equalTo(87)
            $0.leading.equalTo(28)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(userImage.snp.trailing).offset(20)
            $0.top.equalTo(97)
        }
        
        logoutButton.snp.makeConstraints {
            $0.trailing.equalTo(-30)
            $0.top.equalTo(83)
            $0.size.equalTo(30)
        }
        
        starLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        mailImage.snp.makeConstraints {
            $0.top.equalTo(starLabel.snp.bottom).offset(18)
            $0.leading.equalTo(starLabel.snp.leading)
        }
        mailLabel.snp.makeConstraints {
            $0.leading.equalTo(mailImage.snp.trailing).offset(5)
            $0.top.equalTo(starLabel.snp.bottom).offset(20)
        }
        
        postImage.snp.makeConstraints {
            $0.leading.equalTo(mailImage.snp.leading)
            $0.top.equalTo(mailImage.snp.bottom).offset(10)
        }
        
        postLabel.snp.makeConstraints {
            $0.leading.equalTo(postImage.snp.trailing).offset(5)
            $0.top.equalTo(mailLabel.snp.bottom).offset(14)
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(postLabel.snp.bottom).offset(43)
        }
    }
}
