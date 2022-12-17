//
//  MainDetailView.swift
//  ShootingStar
//
//  Created by 박준하 on 2022/12/18.
//  Copyright © 2022 com.asdf. All rights reserved.
//
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class BagesDetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    var bageList: PostNoticeModel?
    
    var disposeBag = DisposeBag()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let bagesTapSectionView = BagesIntroduceView(frame: .zero, viewController: self)
        
        let newBagesSectionView = ProductView(frame: .zero, viewController: self, viewName: "인기상품")
        
        let lastTextView = LastTextView(frame: .zero, viewController: self)
        
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(640.0)
        }
        
        let lastSpacingView = UIView()
        lastSpacingView.snp.makeConstraints {
            $0.height.equalTo(250)
        }
        
        [
            bagesTapSectionView,
            spacingView,
            newBagesSectionView,
            lastTextView,
            lastSpacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }
    private let buttonView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var purchaseButton = UIButton().then {
        $0.setTitle("하트", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
    
    private lazy var giftButton = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .black), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        attribute()
        layout()
        
//        purchaseButton.rx.tap
//            .bind {
//                print("🧾:: 구매하기!!")
//                self.upView()
//            }
        
        
        
    }
}
private extension BagesDetailViewController {

    func setupLayout() {
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

    func attribute() {
        view.backgroundColor = .systemBackground
        
        purchaseButton.layer.cornerRadius = 10
        giftButton.layer.cornerRadius = 10
    }
    
    func layout() {
        [
            buttonView,
            purchaseButton,
            giftButton
        ].forEach { view.addSubview($0) }
        
        buttonView.snp.makeConstraints {
          $0.left.right.bottom.equalToSuperview()
          $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
        purchaseButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.height.equalTo(40.0)
            $0.width.equalTo(40.0)
        }
        
        giftButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(20)
            $0.height.equalTo(50.0)
            $0.width.equalTo(300.0)
        }
    }
    
    @objc func dismissTap(sender: UIButton!){
        self.dismiss(animated: true)
    }
    
//    func detailGiftViewController() {
//
//        let detailGiftVC = BagesDetailGiftViewController()
//
//        navigationController?.pushViewController(detailGiftVC, animated: true)
//    }
    
    func upView() {
        Observable<Int>.interval(.seconds(Int(0)), scheduler: MainScheduler.instance)
            .take(0)
            .subscribe(onNext: { value in
              print(value)
            }, onError: { error in
              print(error)
            }, onCompleted: {
              print("onCompleted")
            }, onDisposed: {
              print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {

            print("시간 나면 올라갈 듯")
        }
    }
}
