import UIKit
import SnapKit
import Then

class ConstellationTableViewCell: UITableViewCell {
    static let cellID = "CellID"
    let img: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
        
    // label 생성
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [img, label].forEach { self.addSubview($0) }
        img.layer.cornerRadius = 20  
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout() {
        img.snp.makeConstraints {
            $0.top.left.equalTo(self).inset(5)
            $0.height.width.equalTo(40)
        }
        label.snp.makeConstraints {
            $0.left.equalTo(img.snp.right).inset(-20)
            $0.centerY.equalTo(self)
        }
    }
}
