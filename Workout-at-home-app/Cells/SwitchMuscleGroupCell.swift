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
        self.layer.cornerRadius = 10
    }
}
