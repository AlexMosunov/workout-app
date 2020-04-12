//
//  MuscleGroupCell.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 30.03.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit

class MuscleGroupCell: UICollectionViewCell {
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = 5
    }
    
    
}
