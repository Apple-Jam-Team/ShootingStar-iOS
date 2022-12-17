import UIKit

class MainVC: BaseVC<BaseViewModel> {

    override func configureVC() {
        view.backgroundColor = .systemBackground
    }
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let advertisementSectionView = AdvertisementSectionView(frame: .zero, viewController: self)
        
        let categorySectionView = CategorySectionView(frame: .zero, viewController: self)
        
        let popularBadgesView = ProductView(frame: .zero, viewController: self, viewName: "인기상품")
        
        let newBadgesView = ProductView(frame: .zero, viewController: self, viewName: "신규상품")
        
        let lastTextView = LastTextView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(60.0)
        }
        let viewSpacingView = UIView()
        viewSpacingView.snp.makeConstraints {
            $0.height.equalTo(60.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
        
        [
            advertisementSectionView,
            spacingView,
            categorySectionView,
            viewSpacingView,
            popularBadgesView,
            spacingView,
            newBadgesView,
            lastTextView,
            lastSpacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
