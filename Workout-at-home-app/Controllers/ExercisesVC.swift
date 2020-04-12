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
    var muscleGroup: MuscleGroup?
    var exercise: Exercise?

    
    let sectionInsetsVertical = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    let sectionInsetsHorizontal = UIEdgeInsets(top: 18.0, left: 20.0, bottom: 18.0, right: 20.0)
    let itemsPerRow: CGFloat = 1
    let itemsPerColumn: CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.gray]        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destVC = segue.destination as! ExerciseDetailsVC
            destVC.exercise = sender as? Exercise
        }
    }
    
    
    
}

//MARK: - UICollectionViewDelegate

extension ExercisesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if let cell = muscleGroupsCollectionView.cellForItem(at: indexPath) as? SwitchMuscleGroupCell {
//            cell.layer.borderColor = UIColor.green.cgColor
//        }
        
        if collectionView == exercisesCollectionView {
            
            if let ex = muscleGroup?.exercisesList![indexPath.row] {
                performSegue(withIdentifier: "goToDetails", sender: ex)
            }
            
        } else if collectionView == muscleGroupsCollectionView {
            
            muscleGroup = muscleGroupsList.muscleGroups[indexPath.row]
            
            muscleGroupsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            exercisesCollectionView.reloadData()
            muscleGroupsCollectionView.reloadData()
            
        }
        
        
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//
//
//        if let cell = muscleGroupsCollectionView.cellForItem(at: indexPath) as? SwitchMuscleGroupCell {
//            cell.layer.borderColor = UIColor.gray.cgColor
//
//        }
//    }
    
}


//MARK: - UICollectionViewDataSource

extension ExercisesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == exercisesCollectionView {
            
            return muscleGroup?.exercisesList?.count ?? 0
            
        } else if collectionView == muscleGroupsCollectionView {
            return muscleGroupsList.muscleGroups.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == muscleGroupsCollectionView {
            let muscleGroupCell = muscleGroupsCollectionView.dequeueReusableCell(withReuseIdentifier: "SwitchMuscleGroupCell", for: indexPath) as! SwitchMuscleGroupCell
            let muscleGroupName = muscleGroupsList.muscleGroups[indexPath.row].groupName
            
            muscleGroupCell.muscleGroupLabel.text = muscleGroupName
            
            // make green borders to muscleGroupCell with muscle group that was selected in MainViewController and scroll to this item
            if muscleGroupName == muscleGroup?.groupName {
                muscleGroupCell.isSelected = true
                muscleGroupsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            } else {
                muscleGroupCell.isSelected = false
            }
            
  
            ///
            
            return muscleGroupCell
            
        } else if collectionView == exercisesCollectionView {
            let exerciseCell = exercisesCollectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
            
            if let ex = muscleGroup?.exercisesList![indexPath.row] {
                exerciseCell.exerciseImage.image = UIImage(named: ex.videoBanner)
                exerciseCell.exerciseNameLabel.text = ex.name
            }
            
            return exerciseCell
            
        }
        return UICollectionViewCell()
    }
    
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension ExercisesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        if collectionView == exercisesCollectionView {
            let paddingSpace = sectionInsetsVertical.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            
            return CGSize(width: widthPerItem, height: widthPerItem / 2.5)
            
        } else if collectionView == muscleGroupsCollectionView {

//            let paddingSpace = sectionInsetsHorizontal.top * (itemsPerColumn + 1)
//            let availableHeight = view.frame.height - paddingSpace
//            let heightPerItem = availableHeight / itemsPerColumn
            
            return CGSize(width: 120, height: 55)
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == exercisesCollectionView {
            return sectionInsetsVertical
        }
        
        return sectionInsetsHorizontal
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == exercisesCollectionView {
            return sectionInsetsVertical.left
        }
        
        return sectionInsetsHorizontal.left - 10
    }
    
}
