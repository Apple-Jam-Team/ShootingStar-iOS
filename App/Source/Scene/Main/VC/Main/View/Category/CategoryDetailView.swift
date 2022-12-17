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
    
    var postNoticeModel = [PostNoticeModel]()
    
    var array = ["first","second","third","fourth","fifth","6","7","8","9","10","11","12"]
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
//        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
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
                if index == 0 {
                    cell.imageView.image = UIImage(named: "image1")
                    cell.titleLabel.text = "디자인이 하기 싶은 옷"
                    cell.PriceLabel.text = "10,000"
                } else if index == 1 {
                    cell.imageView.image = UIImage(named: "image2")
                    cell.titleLabel.text = "간지 나는 옷"
                    cell.PriceLabel.text = "10,000"
                } else if index == 2 {
                    cell.imageView.image = UIImage(named: "image3")
                    cell.titleLabel.text = "깔끔한 옷"
                    cell.PriceLabel.text = "10,000"
                } else if index == 3 {
                    cell.imageView.image = UIImage(named: "image4")
                    cell.titleLabel.text = "주목 받고 싶은 옷"
                    cell.PriceLabel.text = "10,000"
                } else if index == 4 {
                    cell.imageView.image = UIImage(named: "image5")
                    cell.titleLabel.text = "혼란의 가방"
                    cell.PriceLabel.text = "10,000"
                } else if index == 5 {
                    cell.imageView.image = UIImage(named: "image6")
                    cell.titleLabel.text = "깔끔한 옷"
                    cell.PriceLabel.text = "10,000"
                } else if index == 6 {
                    cell.imageView.image = UIImage(named: "image7")
                    cell.titleLabel.text = "소름 돋는 목걸이"
                    cell.PriceLabel.text = "10,000"
                } else if index == 7 {
                    cell.imageView.image = UIImage(named: "image8")
                    cell.titleLabel.text = "후드티"
                    cell.PriceLabel.text = "10,000"
                } else if index == 8 {
                    cell.imageView.image = UIImage(named: "image9")
                    cell.titleLabel.text = "다람쥐"
                    cell.PriceLabel.text = "10,000"
                } else if index == 9 {
                    cell.imageView.image = UIImage(named: "image10")
                    cell.titleLabel.text = "커스텀 모자"
                    cell.PriceLabel.text = "10,000"
                }else if index == 10 {
                    cell.imageView.image = UIImage(named: "image11")
                    cell.titleLabel.text = "널널한 후드"
                    cell.PriceLabel.text = "10,000"
                } else {
                    cell.imageView.image = UIImage(named: "image12")
                    cell.titleLabel.text = "멋진 옷"
                    cell.PriceLabel.text = "10,000"
                }
            }
    }
}

extension CategoryDetailViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 20

        let width : CGFloat = (collectionView.bounds.width - 10 - itemSpacing * 2) / 2

        return CGSize(width: width, height: width + 30)
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
        
        view.backgroundColor = .white
        
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
