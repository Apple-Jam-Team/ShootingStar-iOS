//
//  File.swift
//  ShootingStar
//
//  Created by 박준하 on 2022/12/18.
//  Copyright © 2022 com.asdf. All rights reserved.
//

import UIKit
import RxSwift
import RxFlow
import RxCocoa
import SnapKit

class CategoryDetailViewController: UIViewController {
    
    open var Title = ""
    
    var array = ["first","second","third","fourth","fifth","6","7","8","9","10","11","12"]
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
//        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Observable<[String]>.of(self.array)

        attribute()
        layout()
        
        title = "\(Title)"
        
        data.asObservable()
            .bind(to: collectionView.rx
                    .items(
                        cellIdentifier: CategoryCollectionViewCell.identifier,
                        cellType: CategoryCollectionViewCell.self)
            ) { index, recommend, cell in
                cell.setup()
                cell.layer.cornerRadius = 10
            }
    }
}

extension CategoryDetailViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 20

        let width : CGFloat = (collectionView.bounds.width - 10 - itemSpacing * 2) / 2

        return CGSize(width: width, height: width + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)가 눌렸어")
    }
}

extension CategoryDetailViewController {
    
    private func attribute() {
        
        view.backgroundColor = .black
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func layout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
