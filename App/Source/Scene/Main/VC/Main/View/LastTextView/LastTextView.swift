import UIKit
import Then
import SnapKit

class LastTextView: UIView {
    
    private final var controller: UIViewController
    
    private lazy var nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .thin)
        $0.textColor = .systemGray2
        $0.text = "별똥별"
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .thin)
        $0.textColor = .systemGray2
        $0.text = "© 2022. appJam we occupy with ShootingStar"
    }
    
    private lazy var inquiryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .thin)
        $0.textColor = .systemGray2
        $0.text = "문의    010-8581-7469"
    }
    
    private lazy var addressLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .thin)
        $0.textColor = .systemGray2
        $0.text = "주소    appJamKorea"
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LastTextView {
    
    func attribute() {
    }
    
    func layout() {
        [
            nameLabel,
            dateLabel,
            inquiryLabel,
            addressLabel
        ].forEach { addSubview($0) }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(30)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2.0)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        inquiryLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(30.0)
            $0.leading.equalTo(dateLabel.snp.leading)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(inquiryLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(inquiryLabel.snp.leading)
        }
    }
}
