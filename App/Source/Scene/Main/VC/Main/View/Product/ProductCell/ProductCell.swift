import SnapKit
import Then
import UIKit

final class ProductCell: UICollectionViewCell {
    static var height: CGFloat { 310.0 }
    static var width: CGFloat { 220.0 }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        imageView.layer.cornerRadius = 20.0

        return imageView
    }()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "상품"
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "Made by appJam"
    }

    private lazy var PriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "1,000,000원"
    }

    func setup() {
        setupLayout()
    }
}

// MARK: Private
private extension ProductCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            PriceLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(220.0)
            $0.width.equalTo(220.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(15.0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.0)
        }
        PriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
