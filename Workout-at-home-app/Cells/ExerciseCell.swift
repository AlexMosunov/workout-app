//
//  ExerciseCell.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 04.04.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit

class ExerciseCell: UICollectionViewCell {
    
    
    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    override func awakeFromNib() {
           self.layer.cornerRadius = 1
       }
}
