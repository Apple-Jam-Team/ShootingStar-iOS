import SnapKit
import Then
import UIKit
import RxSwift

final class AdvertisementSectionView: UIView {
    private final var controller: UIViewController
    
    var images = ["Image", "Image", "Image", "Image", "Image", "Image"]
    
    private var array = ["1","2","3","4","5","6","7","8"]

    @objc
    private func pageControlDidTap(_ sender: UIPageControl) {
        let current = sender.currentPage
        pageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * controller.view.frame.size.width, y: 0), animated: true)
    }
    
    private let pageControl = UIPageControl().then {
        $0.addTarget(AdvertisementSectionView.self, action: #selector(pageControlDidTap), for: .valueChanged)
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            AdvertisementCell.self,
            forCellWithReuseIdentifier: "AdvertisementCell"
        )

        return collectionView
    }()
    
    internal lazy var pageScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.backgroundColor = .gray
    }
    
    private let pageContentView = UIView()

    private func addContentScrollView() {
        
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = UIImage(named: images[i])
            pageContentView.addSubview(imageView)
            imageView.snp.makeConstraints {
                $0.centerX.equalTo(controller.view.frame.width / 2 + controller.view.frame.width * CGFloat(i))
                $0.height.equalToSuperview()
                $0.width.equalTo(pageScrollView.snp.width).multipliedBy(0.9)
                $0.top.equalToSuperview()
            }
        }
    }
    
    func addView() {
        [
            pageScrollView,
            pageControl
        ].forEach { controller.view.addSubview($0) }
        self.pageScrollView.addSubview(pageContentView)
        pageScrollView.contentSize = pageContentView.frame.size
        addContentScrollView()
        setPageControl()
    }

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
        addView()
        addContentScrollView()
        setPageControl()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdvertisementSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "AdvertisementCell",
            for: indexPath
        ) as? AdvertisementCell
        cell?.setup()
        
        return cell!
    }
}

extension AdvertisementSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //주변의 왼 = 16 // 오른 = 16 == 32 뺴기
        CGSize(width: collectionView.frame.width - 60.0, height: frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //주변의 왼 = 16 // 오른 = 16
        //중앙 정령
        UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //최소 마진
        return 60.0
    }
}

private extension AdvertisementSectionView {
    
    func attribute() {
        
    }
    
    func layout() {
        [
            collectionView
        ].forEach { addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(120)
            $0.width.equalTo(370)
            $0.bottom.equalToSuperview()
        }
    }
}

extension AdvertisementSectionView : UIScrollViewDelegate {
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == pageScrollView {
            let value = scrollView.contentOffset.x/scrollView.bounds.size.width
            setPageControlSelectedPage(currentPage: Int(round(value)))
        }
    }
}
