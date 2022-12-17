import SnapKit
import Then
import UIKit

final class CategorySectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    static var height: CGFloat { 100.0 }
    static var width: CGFloat { 100.0 }

    internal lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0

        return imageView
    }()
    
    internal lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
        $0.text = "추천🔔"
    }
    
    func setupLayout() {
        [
            imageView,
            titleLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4.0)
            $0.bottom.equalToSuperview().inset(4.0)
            $0.width.equalTo(imageView.snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
