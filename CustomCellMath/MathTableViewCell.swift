//
//  MathTableViewCell.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class MathTableViewCell: UITableViewCell {

    @IBOutlet weak var firstPLabel: UILabel!
    
    @IBOutlet weak var secondPLabel: UILabel!
    
    @IBOutlet weak var thirdPLabel: UILabel!
    
    @IBOutlet weak var fourthPLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
