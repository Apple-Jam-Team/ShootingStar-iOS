import UIKit
import Then
import SnapKit

class BagesIntroduceView: UIView {
    private final var controller: UIViewController
    
    var bageList: PostNoticeModel?
    
    private lazy var mainBagesImage = UIImageView().then {
        $0.image = ShootingStarAsset.Assets.image1.image
        $0.backgroundColor = .gray
    }
    
    private lazy var bagesName = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .black
        $0.text = "상품 이름"
    }
    
    private lazy var bagesdescriptions = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.text = "설명설명설명설명설명설명설명설명설명설명\n설명설명설명설명설명설명설명설명설명설명설명"
    }
    
    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .black
        $0.text = "12,000원"
    }
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10.0, weight: .bold)
        $0.textColor = .black
        $0.text = "Made by 준하팍"
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        setup()
        
//        mainBagesImage.image = UIImage(named: "\(bageList.)")
        mainBagesImage.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BagesIntroduceView {
    func setup() {
        [
            mainBagesImage,
            bagesName,
            bagesdescriptions,
            coinPriceLabel,
            separator,
            nameLabel
        ].forEach { self.addSubview($0) }
        
        mainBagesImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(370)
            $0.width.equalTo(370)
        }
        
        bagesName.snp.makeConstraints {
            $0.top.equalTo(mainBagesImage.snp.bottom).offset(40.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        bagesdescriptions.snp.makeConstraints {
            $0.top.equalTo(bagesName.snp.bottom).offset(25.0)
            $0.leading.equalTo(bagesName.snp.leading)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(bagesdescriptions.snp.bottom).offset(20.0)
            $0.leading.equalTo(bagesdescriptions.snp.leading)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(10.0)
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(bagesName.snp.bottom).offset(2.0)
            $0.leading.equalTo(bagesName.snp.leading)
        }
    }
}
