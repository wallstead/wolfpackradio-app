//
//  ViewController.swift
//  WPR
//
//  Created by Willis Allstead on 2/15/17.
//  Copyright © 2017 Willis Allstead. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer



class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let url = "http://38.135.36.124:7209/stream"
        let url = "http://178.33.104.250:80/stream2"
        let playerItem = AVPlayerItem(url: URL(string: url)!)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0;
        player.play()
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error man [expound]")
        }
        
        playButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.pauseCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.stopPlaying()
            return MPRemoteCommandHandlerStatus.success
        }
        
        commandCenter.playCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.startPlaying()
            return MPRemoteCommandHandlerStatus.success
        }
        
        
        
    }

    
    
    @IBAction func playToggled(_ sender: UIButton) {
        if ((player.rate != 0) && (player.error == nil)) { // player is playing
            stopPlaying()
        } else {
            startPlaying()
        }
    }
    
    func stopPlaying() {
        player.pause()
        playButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
        
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print("error man [expound]")
        }
    }
    
    func startPlaying() {
        player.play()
        playButton.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error man [expound]")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Bool {
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}

