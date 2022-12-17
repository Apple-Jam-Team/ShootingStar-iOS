import UIKit
import Then
import SnapKit
import RxCocoa
import Foundation
import RxSwift

class ProductView: UIView {
    private final var controller: UIViewController
    private final var viewName: String
    let disposeBag = DisposeBag()
    
    var postNoticeModel = [PostNoticeModel].self
    
    private lazy var newProductLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "신규 배지"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        
        collectionView.register(
            ProductCell.self,
            forCellWithReuseIdentifier: "NewProductCellCollectionViewCell"
        )
        
      return collectionView
    }()
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController, viewName: String) {
        controller = viewController
        self.viewName = viewName
        super.init(frame: frame)
        newProductLabel.text = viewName
        
        attribute()
        layout()
//        let FullPath = "/Users/sunghun/Desktop/ios/test/ShootingStar-iOS/App/Source/AppData/GetNoticeDetail.json"
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//        guard let path = documentDirectory?.appendingPathComponent(FullPath) else { return }
//        print()
        if let data = try? String(contentsOfFile: FullPath).data(using: .utf8) {
            guard let datas = String(data: data, encoding: .utf8) else { return }
            print(datas)
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]
                print("asdf", json as Any)
            } catch {
                print("asdf", error.localizedDescription)
            }
        } else {
            print("asdf")
        }
        
        
        
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ProductView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: ProductCell.width,
            height: ProductCell.height
        )
    }
}

extension ProductView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NewProductCellCollectionViewCell",
            for: indexPath
        ) as? ProductCell
        cell!.setup()
        cell!.backgroundColor = .clear
        return cell ?? UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedSuggesion = bagesList[indexPath.row]
//        print(bagesList[indexPath.row])
//        let detailViewController = SuggesionDetailViewController()
//        detailViewController.suggestion = selectedSuggesion
//        controller.present(detailViewController, animated: true)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension ProductView {
    
    func attribute() {
        self.backgroundColor = .black
    }
    
    func layout() {
        [
            newProductLabel,
            collectionView,
            separator
        ].forEach { self.addSubview($0) }
        
        newProductLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(newProductLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(310)
            $0.width.equalTo(220)
            $0.bottom.equalToSuperview()
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30.0)
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
        }
    }
}
