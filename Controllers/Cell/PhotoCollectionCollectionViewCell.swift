//
//  PhotoCollectionCollectionViewCell.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var customImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customImageView.contentMode = .scaleToFill
        
    }

}
