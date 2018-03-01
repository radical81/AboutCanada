//
//  FactTableViewCell.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 1/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var factDescription: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
