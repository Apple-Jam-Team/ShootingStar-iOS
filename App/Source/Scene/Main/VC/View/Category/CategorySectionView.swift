import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class CategorySectionView: UIView {
    private final var controller: UIViewController
    private var array = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var disposeBag = DisposeBag()
    
    private lazy var categoryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "카테고리"
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
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            CategorySectionViewCell.self,
            forCellWithReuseIdentifier: "CategoryCollectionViewCell"
        )
        
      return collectionView
    }()
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        attribute()
        layout()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategorySectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: CategorySectionViewCell.width,
            height: CategorySectionViewCell.height
        )
    }
}

extension CategorySectionView {
    
    func attribute() {
        self.backgroundColor = .black
        let data = Observable<[String]>.of(self.array)
        
        data.asObservable()
            .bind(to: collectionView.rx
                    .items(
                        cellIdentifier: CategorySectionViewCell.identifier,
                        cellType: CategorySectionViewCell.self)
            ) { index, recommend, cell in
                cell.layer.cornerRadius = 20
            }.disposed(by: disposeBag)
    }
    
    func layout() {
        [
            categoryLabel,
            collectionView,
            separator
        ].forEach { self.addSubview($0) }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(categoryLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
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
