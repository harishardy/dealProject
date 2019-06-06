//
//  firstTableViewCell.swift
//  dealProject
//
//  Created by harishardy on 05/06/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import UIKit

class firstTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imageViewX1: UIImageView!
    
    
    @IBOutlet weak var labelX1: UILabel!
    
    
    @IBOutlet weak var labelX2: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
