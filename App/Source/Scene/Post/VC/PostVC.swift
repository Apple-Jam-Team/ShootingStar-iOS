import UIKit
import Firebase
import Then
import SnapKit

class PostVC: BaseVC<PostViewModel> {
    private var name = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "상품 이름을 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var price = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "상품 가격을 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    lazy var textView: UITextView = {
        let view = UITextView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        view.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        view.font = .systemFont(ofSize: 18)
        view.text = "상품 설명을 입력해주세요."
        view.textColor = .lightGray
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.delegate = self
        return view
    }()
    private let leftCount1 = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .black)
        $0.text = "L(110-115) / 2개"
        $0.textColor = .black
        $0.layer.borderWidth = 1
        //테두리 색상
        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    private let leftCount2 = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .black)
        $0.text = "M(95-105) / 100개"
        $0.textColor = .black
        $0.layer.borderWidth = 1
        //테두리 색상
        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    private var size = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "추가할 사이즈를 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var count = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "수량을 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private var addButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        $0.setTitle("추가하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.titleLabel?.textAlignment = .center
    }
    private var addImg = UIImageView().then {
        $0.image = UIImage(named: "user1")
    }
    private let contentView = UIView()
    let scrollView = UIScrollView()
    private var postButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        $0.setTitle("상품 등록하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.titleLabel?.textAlignment = .center
    }
    override func addView() {
        view.addSubViews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews(name,
                                price,
                                textView,
                                leftCount1,
                                leftCount2,
                                size,
                                count,
                                addButton,
                                addImg,
                                postButton)
    }
    override func setLayout() {
        self.view.backgroundColor = .yellow
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.bottom.equalTo(postButton.snp.bottom)
        }
        contentView.snp.makeConstraints {
            $0.topMargin.equalTo(scrollView.snp.topMargin)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.height.equalTo(view.snp.height)
            $0.centerX.centerY.equalToSuperview()
        }
        name.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(60)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        price.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(120)
        }
        leftCount1.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).inset(-20)
            $0.leading.equalTo(textView.snp.leading)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        leftCount2.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).inset(-20)
            $0.leading.equalTo(leftCount1.snp.trailing).inset(-10)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        size.snp.makeConstraints {
            $0.top.equalTo(leftCount1.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        count.snp.makeConstraints {
            $0.top.equalTo(size.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        addButton.snp.makeConstraints {
            $0.top.equalTo(count.snp.bottom).inset(-10)
            $0.right.equalToSuperview().inset(30)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
        addImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(150)
            $0.top.equalTo(addButton.snp.bottom).inset(-20)
        }
        postButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(160)
            $0.top.equalTo(addImg.snp.bottom).inset(-20)
        }
    }
    override func configureVC() {
        view.backgroundColor = UIColor(named: "Main")
    }
}
extension PostVC: UITextViewDelegate {
   
   func textViewDidBeginEditing(_ textView: UITextView) {
   // TextColor로 처리합니다. text로 처리하게 된다면 placeholder와 같은걸 써버리면 동작이 이상하겠죠?
       if textView.textColor == UIColor.lightGray {
           textView.text = nil // 텍스트를 날려줌
           textView.textColor = UIColor.black
       }
       
   }
   // UITextView의 placeholder
   func textViewDidEndEditing(_ textView: UITextView) {
       if textView.text.isEmpty {
           textView.text = "상품 설명을 입력해주세요."
           textView.textColor = UIColor.lightGray
       }
   }
   
}
