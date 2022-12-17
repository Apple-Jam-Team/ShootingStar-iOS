import UIKit
import Firebase
import Then
import SnapKit

class ConstellationVC: BaseVC<ConstellationVM> {
    let images: [String] = [
        "user1",
        "user2",
        "user3",
        "user4"
    ]
    let texts: [String] = [
        "참새자리",
        "승재잠자리",
        "자고싶자리",
        "졸리자리"
    ] // 임시 더미 데이터
    private var searchTF = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setLeftPaddingPoints(24)
        $0.backgroundColor = .white
        $0.placeholder = "별자리를 입력해주세요."
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private let titleLabel = UILabel().then {
        $0.text = "추천 별자리"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    private let tableView = UITableView().then {
        $0.rowHeight = 49
        $0.backgroundColor = .clear
    }
    override func addView() {
        [
            tableView,
            searchTF,
            titleLabel
        ].forEach { view.addSubview($0) }
    }
    override func configureVC() {
        tableView.register(ConstellationTableViewCell.self, forCellReuseIdentifier: ConstellationTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func setLayout() {
        searchTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.topMargin.equalTo(42)
            $0.height.equalTo(50)
            $0.leadingMargin.trailingMargin.equalTo(30)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(searchTF.snp.bottom).inset(-40)
            $0.leftMargin.equalTo(30)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-20)
            $0.leftMargin.rightMargin.equalTo(30)
            $0.bottom.equalToSuperview()
        }
    }
}
extension ConstellationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: ConstellationTableViewCell.cellID,
                                                               for: indexPath) as? ConstellationTableViewCell) else {
            let tableviewcell = UITableViewCell()
            return tableviewcell
        }
        cell.label.text = texts[indexPath.row]
        cell.img.image = UIImage(named: images[indexPath.row])
        cell.img.layer.cornerRadius = 20
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
    }
}
