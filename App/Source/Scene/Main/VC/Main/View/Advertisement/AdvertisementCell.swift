//
//  AdvertisementCel.swift
//  ShootingStar
//
//  Created by 박준하 on 2022/12/18.
//  Copyright © 2022 com.asdf. All rights reserved.
//

import UIKit
import SnapKit
import Then

class AdvertisementCell: UICollectionViewCell {
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "스크린샷 2022-12-18 오전 7.53.14")
    }
    
    func setup() {
        [
            titleImage
        ].forEach { addSubview($0) }

        titleImage.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

