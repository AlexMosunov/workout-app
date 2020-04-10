//
//  ExercisesVC.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 04.04.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit

class ExercisesVC: UIViewController {
    
    @IBOutlet weak var muscleGroupsCollectionView: UICollectionView!
    @IBOutlet weak var exercisesCollectionView: UICollectionView!
    
    
    
    var muscleGroupsList = MuscleGroupList()
    var exercisesList = ExercisesList()
    
    var muscleGroup: MuscleGroup?
    //    var selectedExercise: Exercise?
    
    
    var exercise: Exercise?
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
    let itemsPerRow: CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destVC = segue.destination as! ExerciseDetailsVC
            destVC.exercise = sender as? Exercise
        }
    }
    
    
    func getExercises() -> [Exercise]? {
        if let selectedMuscleGroup = muscleGroup?.groupName {
            let exercises = exercisesList.exercises(muscleGroup: selectedMuscleGroup)
            return exercises
        }
        return nil
    }
    
}



extension ExercisesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == exercisesCollectionView {
            
            let exercises = getExercises()
            let selectedExercise = exercises?[indexPath.row]
            performSegue(withIdentifier: "goToDetails", sender: selectedExercise)
            
        }
        
        if collectionView == muscleGroupsCollectionView {
            print(indexPath.row)
            exercisesCollectionView.backgroundColor = .black
            
            
            let exerciseCell = exercisesCollectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
            exerciseCell.exerciseImage.image = UIImage(named: "error")
            
            
            let exercises = getExercises()
            let exercise = exercises?[indexPath.row]
            exerciseCell.exerciseImage.image = UIImage(named: exercise?.videoBanner ?? "error")
            
            
        }
        
        
    }
    
}



extension ExercisesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == exercisesCollectionView {
            
            let exercises = getExercises()
            return exercises?.count ?? 0
            
            
        }
        
        if collectionView == muscleGroupsCollectionView {
            return muscleGroupsList.muscleGroups.count
        }
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == muscleGroupsCollectionView {
            let muscleGroupCell = muscleGroupsCollectionView.dequeueReusableCell(withReuseIdentifier: "SwitchMuscleGroupCell", for: indexPath) as! SwitchMuscleGroupCell
            let muscleGroupName = muscleGroupsList.muscleGroups[indexPath.row].groupName
            
            muscleGroupCell.muscleGroupLabel.text = muscleGroupName
            return muscleGroupCell
        }
        
        
        if (collectionView == exercisesCollectionView) {
            let exerciseCell = exercisesCollectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
            
            
            let exercises = getExercises()
            let exercise = exercises?[indexPath.row]
            exerciseCell.exerciseImage.image = UIImage(named: exercise?.videoBanner ?? "error")
            
            
            return exerciseCell
            
            
            
        }
        return UICollectionViewCell()
        
    }
    
}



extension ExercisesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        if collectionView == exercisesCollectionView {
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            
            return CGSize(width: widthPerItem, height: widthPerItem / 2)
        }
        return CGSize(width: 125, height: 70)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == muscleGroupsCollectionView {
            return 20
        }
        return sectionInsets.left
    }
    
    
}
