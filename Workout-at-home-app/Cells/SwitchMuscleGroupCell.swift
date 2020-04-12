//
//  SwitchMuscleGroupCell.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 04.04.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit

class SwitchMuscleGroupCell: UICollectionViewCell {
    
    
    @IBOutlet weak var muscleGroupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.cornerRadius = 2.0
        
        let grayBorders = UIView(frame: bounds)
        grayBorders.layer.borderWidth = 1.0
        grayBorders.layer.borderColor = UIColor.gray.cgColor
        grayBorders.layer.cornerRadius = 2.0
        self.backgroundView = grayBorders
        
        
        let greenBorders = UIView(frame: bounds)
        greenBorders.layer.borderWidth = 1.0
        greenBorders.layer.borderColor = UIColor.green.cgColor
        greenBorders.layer.cornerRadius = 2.0
        self.selectedBackgroundView = greenBorders
        
//        self.layer.cornerRadius = 5.0
//        self.layer.borderWidth = 5.0
//        self.layer.borderColor = UIColor.clear.cgColor
//        self.layer.masksToBounds = true
//        
//        // cell shadow section
//        self.contentView.layer.cornerRadius = 5.0
//        self.contentView.layer.borderWidth = 5.0
//        self.contentView.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.layer.masksToBounds = true
//        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
//        self.layer.shadowRadius = 6.0
//        self.layer.shadowOpacity = 0.6
//        self.layer.cornerRadius = 5.0
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

//        self.layer.cornerRadius = 10
    }
}
