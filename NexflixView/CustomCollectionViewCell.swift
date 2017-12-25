//
//  CustomCollectionViewCell.swift
//  NexflixView
//
//  Created by Richard Crichlow on 12/24/17.
//  Copyright © 2017 Richard Crichlow. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.contentMode = .scaleAspectFit
    }
    
    
}
