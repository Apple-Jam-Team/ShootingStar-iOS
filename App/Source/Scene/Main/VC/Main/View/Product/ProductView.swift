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
    
    var postNoticeModel = [PostNoticeModel]()
    
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
        
        postNoticeModel = [
            PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image1", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image2", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image3", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image4", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image5", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image6", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image7", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image8", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image9", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image10", productName: "멋진 상품", producer: "나나", price: 123)), PostNoticeModel(arrayLiteral: PostNoticeModelElement(noticeImage: "image11", productName: "멋진 상품", producer: "나나", price: 123))
        ]
        let FullPath = "/Users/junha/Desktop/ShootingStar/ShootingStar-iOS/App/Source/AppData/GetNoticeDetail.json"
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
//        if let data = try? String(contentsOfFile: FullPath).data(using: .utf8) {
//                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
//                print(json)
//        }
//        guard let path = documentDirectory?.appendingPathComponent(FullPath) else { return }
//        print()
        
//        if let data = try? String(contentsOfFile: FullPath).data(using: .utf8) {
//            guard let datas = String(data: data, encoding: .utf8) else { return }
////            let data = try JSONDecoder().decode([PostNoticeModel].self, from: data.utf8)
//
//            if let data = try String(contentsOfFile: FullPath).data(using: .utf8) {
//                    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
//                    print(json)
//            }
//            print(datas)
//
//
//            let data = try JSONDecoder().decode(PostNoticeModel.self, from: )
//            do {
//                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]
//                print("asdf", json as Any)
//            } catch {
//                print("asdf", error.localizedDescription)
//            }
//        } else {
//            print("asdf")
//        }
//
        
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
        return postNoticeModel.count
    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NewProductCellCollectionViewCell",
            for: indexPath
        ) as? ProductCell
        cell!.setup()
        if indexPath.row == 0 {
            cell?.imageView.image = UIImage(named: "image1")
            cell?.titleLabel.text = "디자인이 하기 싶은 옷"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 1 {
            cell?.imageView.image = UIImage(named: "image2")
            cell?.titleLabel.text = "간지 나는 옷"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 2 {
            cell?.imageView.image = UIImage(named: "image3")
            cell?.titleLabel.text = "깔끔한 옷"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 3 {
            cell?.imageView.image = UIImage(named: "image4")
            cell?.titleLabel.text = "주목 받고 싶은 옷"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 4 {
            cell?.imageView.image = UIImage(named: "image5")
            cell?.titleLabel.text = "혼란의 가방"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 5 {
            cell?.imageView.image = UIImage(named: "image6")
            cell?.titleLabel.text = "깔끔한 옷"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 6 {
            cell?.imageView.image = UIImage(named: "image7")
            cell?.titleLabel.text = "소름 돋는 목걸이"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 7 {
            cell?.imageView.image = UIImage(named: "image8")
            cell?.titleLabel.text = "후드티"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 8 {
            cell?.imageView.image = UIImage(named: "image9")
            cell?.titleLabel.text = "다람쥐"
            cell?.PriceLabel.text = "10,000"
        } else if indexPath.row == 9 {
            cell?.imageView.image = UIImage(named: "image10")
            cell?.titleLabel.text = "커스텀 모자"
            cell?.PriceLabel.text = "10,000"
        }else if indexPath.row == 10 {
            cell?.imageView.image = UIImage(named: "image11")
            cell?.titleLabel.text = "널널한 후드"
            cell?.PriceLabel.text = "10,000"
        } else {
            cell?.imageView.image = UIImage(named: "image12")
            cell?.titleLabel.text = "멋진 옷"
            cell?.PriceLabel.text = "10,000"
        }
        cell!.backgroundColor = .clear
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSuggesion = postNoticeModel[indexPath.row]
        print(postNoticeModel[indexPath.row])
        let detailViewController = BagesDetailViewController()
        detailViewController.bageList = selectedSuggesion
        detailViewController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(detailViewController, animated: true)
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
