//
//  CustomCollectionViewCell.swift
//  collectionViewPractice
//
//  Created by Collin Cannavo on 8/3/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func companyLogoTapped(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
