//
//  CollectionViewCell.swift
//  EffectivePageScroll
//
//  Created by Mohit Shrama on 15/09/19.
//  Copyright © 2019 vaibhav sharma. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 6.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true;
    }
    func updateData(title: String, image : String){
        self.lblTitle.text = "I Love " + title
        self.imageView.image = UIImage(named: image)
    }

}
