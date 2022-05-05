//
//  ViewController.swift
//  hrmph_shows
//
//  Created by Aura Antilochus on 4/30/22.
//  Copyright © 2022 Roman CHAIKIN. All rights reserved.
//

import UIKit
import AVFoundation
var player: AVPlayer?
class ViewController: UIViewController {

    
    
    func playBackgroundVideo2() {
        let path = Bundle.main.path(forResource: "gif2", ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        player?.isMuted = true
    }
    
    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo2()
        // Do any additional setup after loading the view.
    }


}

