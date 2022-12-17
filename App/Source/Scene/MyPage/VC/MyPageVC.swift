import UIKit
import RxSwift
import Then
import SnapKit

class MyPageVC: BaseVC<MyPageViewModel> {
    
    private let scrollView = UIScrollView()
    
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
    
    private let imageView1 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = ShootingStarAsset.Assets.image21.image
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let title1 = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "사이드핀턱이 매력적인\n 와이드팬츠"
    }
    
    private let button1 = UIButton().then {
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = .black
        $0.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    private let imageView2 = UIImageView().then {
        $0.image = ShootingStarAsset.Assets.image51.image
        $0.backgroundColor = .lightGray
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let title2 = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "데이지 에코백"
    }
    
    private let button2 = UIButton().then {
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = .black
        $0.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    private let imageView3 = UIImageView().then {
        $0.image = ShootingStarAsset.Assets.image11.image
        $0.backgroundColor = .lightGray
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let title3 = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.text = "벌룬 니트"
    }
    
    private let button3 = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = .black
        $0.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
        $0.showsMenuAsPrimaryAction = true
    }
    
    override func configureVC() {
        
        scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height)
        logoutButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.setViewControllers([OnBoardingVC(viewModel: .init())], animated: true)
            }).disposed(by: disposeBag)
        
        let alert = UIAlertController(title:"정말로요?",
            message: "정말로 삭제하시겠습니까?",
            preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: {
            action in
            self.button3.isHidden = true
            self.imageView3.isHidden = true
            self.title3.isHidden = true
        })
        alert.addAction(cancle)
        alert.addAction(ok)
        
        let favorite = UIAction(title: "수정하기", handler: { _ in print("수정하기") })
        let cancel = UIAction(title: "삭제하기", attributes: .destructive, handler: { _ in self.present(alert, animated: true) })

        button3.menu = UIMenu(identifier: nil,
                             options: .displayInline,
                             children: [favorite, cancel])
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func addView() {
        view.addSubViews(scrollView)
        scrollView.addSubViews(userImage, nameLabel, starLabel, mailImage, mailLabel, postImage, postLabel, lineView, logoutButton, imageView1, title1, button1, imageView2, imageView3, title2, title3, button2, button3)
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
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
            $0.leading.equalTo(370)
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
        
        imageView1.snp.makeConstraints {
            $0.size.equalTo(170)
            $0.leading.equalTo(30)
            $0.top.equalTo(lineView.snp.bottom).offset(30)
        }
        
        title1.snp.makeConstraints {
            $0.leading.equalTo(imageView1.snp.leading)
            $0.top.equalTo(imageView1.snp.bottom).offset(20)
        }
        
        button1.snp.makeConstraints {
            $0.trailing.equalTo(imageView1.snp.trailing)
            $0.top.equalTo(imageView1.snp.bottom).offset(20)
        }
        
        imageView2.snp.makeConstraints {
            $0.size.equalTo(170)
            $0.leading.equalTo(228)
            $0.top.equalTo(lineView.snp.bottom).offset(30)
        }
        
        title2.snp.makeConstraints {
            $0.leading.equalTo(imageView2.snp.leading)
            $0.top.equalTo(imageView2.snp.bottom).offset(20)
        }
        
        button2.snp.makeConstraints {
            $0.trailing.equalTo(imageView2.snp.trailing)
            $0.top.equalTo(imageView2.snp.bottom).offset(20)
        }
        
        imageView3.snp.makeConstraints {
            $0.size.equalTo(170)
            $0.leading.equalTo(30)
            $0.top.equalTo(lineView.snp.bottom).offset(270)
        }
        
        title3.snp.makeConstraints {
            $0.leading.equalTo(imageView3.snp.leading)
            $0.top.equalTo(imageView3.snp.bottom).offset(20)
        }
        
        button3.snp.makeConstraints {
            $0.trailing.equalTo(imageView3.snp.trailing)
            $0.top.equalTo(imageView3.snp.bottom).offset(20)
        }
    }
}
