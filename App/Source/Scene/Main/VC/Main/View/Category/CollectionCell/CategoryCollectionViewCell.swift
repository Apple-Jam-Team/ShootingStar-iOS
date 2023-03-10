//
//  CategoryCollectionViewCell.swift
//  
//
//  Created by 박준하 on 2022/12/18.
//

import UIKit
import Then
import SnapKit

// Cell
class CategoryCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "cell3"
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        imageView.layer.cornerRadius = 20.0

        return imageView
    }()
    
    var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .black
        $0.text = "상품"
    }
    
    var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.text = "Made by appJam"
    }

    var PriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .black
        $0.text = "1,000,000원"
    }

    func setup() {
        setupLayout()
    }
}

// MARK: Private
private extension CategoryCollectionViewCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            PriceLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(150.0)
            $0.width.equalTo(100.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(15.0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.0)
        }
        PriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

