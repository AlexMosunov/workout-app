//
//  ExerciseDetailsVC.swift
//  Workout-at-home-app
//
//  Created by Alex Mosunov on 05.04.2020.
//  Copyright © 2020 Alex Mosunov. All rights reserved.
//

import UIKit
import AVKit
import WebKit

class ExerciseDetailsVC: UIViewController {

    
    @IBOutlet weak var exerciseImagePreview: UIImageView!
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var exerciseDescription: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: "https://www.youtube.com/embed/2LlqPaPpj0E")!))

        exerciseName.text = exercise?.name
        exerciseDescription.text = exercise?.description
        exerciseImagePreview.image = UIImage(named: exercise?.videoBanner ?? "error")
    }
    

    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        
        webView.load(URLRequest(url: URL(string: "https://youtu.be/ad-Fu5iDbSE")!))
        
        
//        if let exerciseURLString = exercise?.videoURL {
//            print(exerciseURLString)
//            let url = URL(string: exerciseURLString)!
//            let player = AVPlayer(url: url)
//
//            print("url \(url)")
//
//            let playerVC = AVPlayerViewController()
//            playerVC.player = player
//
//            present(playerVC, animated: true) {
//                player.play()
//            }
//        }
//        if let path = Bundle.main.path(forResource: "1", ofType: "m4v") {
//            let video = AVPlayer(url: URL(fileURLWithPath: path))
//            let videoPlayer = AVPlayerViewController()
//
//            videoPlayer.player = video
//            present(videoPlayer, animated: true) {
//                video.play()
//            }
//        }
        
    }
    

}
