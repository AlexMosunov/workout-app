//
//  ViewController.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 30.03.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let itemsPerRow: CGFloat = 2
    
    var muscleGroupList = MuscleGroupList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToExercises" {
            let destVC = segue.destination as! ExercisesVC
            destVC.muscleGroup = sender as? MuscleGroup
        }
    }
}




extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let muscleGroup = muscleGroupList.muscleGroups[indexPath.row]
        performSegue(withIdentifier: "goToExercises", sender: muscleGroup)
    }
    
}



extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        muscleGroupList.muscleGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuscleGroupCell", for: indexPath) as? MuscleGroupCell {
            let muscleGroup = muscleGroupList.muscleGroups[indexPath.row]
            
            itemCell.imageView.image = UIImage(named: muscleGroup.imageName)
            itemCell.textLabel.text = muscleGroup.groupName
            
            return itemCell
        }
        
        return UICollectionViewCell()
    }
    
}



extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      //2
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: widthPerItem)
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
      return sectionInsets.left
    }
}
