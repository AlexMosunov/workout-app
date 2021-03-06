//
//  MuscleGroupModel.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 30.03.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import Foundation

class MuscleGroup {
    var groupName: String
    var imageName: String
    var exercisesList: [Exercise]?
    
    init(groupName: String, imageName: String, exercisesList: [Exercise]?) {
        self.groupName = groupName
        self.imageName = imageName
        self.exercisesList = exercisesList
    }
}
