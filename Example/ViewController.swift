
//
//  ViewController.swift
//  Example
//
//  Created by Soojin Ro on Feb 14, 2020.
//  Copyright © 2020 nsoojin. All rights reserved.
//

import UIKit
import Baraba
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var barabaButton: UIBarButtonItem?
   
    @IBOutlet weak var myView: UIView!
    
    private var baraba: Baraba?
   
     var player: AVPlayer?
     var playerLayer: AVPlayerLayer?
    
    var videoPlayer : AVPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {
                 return
             }
        
        videoPlayer = AVPlayer(url: videoURL)

        let controller = AVPlayerViewController()

        controller.player = videoPlayer


        self.addChild(controller)

        controller.view.frame = myView.bounds
        
        controller.player?.allowsExternalPlayback = false
        
        myView.addSubview(controller.view)
       
        controller.didMove(toParent: self)
        
        tableView?.dataSource = self
        barabaButton?.title = "Pause"
        
        baraba = Baraba(configuration: .automatic)
//        baraba?.scrollView = tableView
        baraba?.delegate = self
        baraba?.resume()
        
        

    }
    

    
    @IBAction func barabaButtonPressed(_ sender: UIBarButtonItem) {
        if baraba?.isActive == true {
            sender.title = "Enable"
            baraba?.pause()
        } else {
            sender.title = "Pause"
            baraba?.resume()
        }
    }
   

    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = "hello \(indexPath.row)"
        
        return cell
    }
}

extension ViewController: BarabaDelegate {
    func barabaDidStartVideo(_ baraba: Baraba) {
        
        videoPlayer!.play()

        
    }
    
    func barabaDidStopVideo(_ baraba: Baraba) {
       
        videoPlayer!.pause()
        
    }
    
    
    func baraba(_ baraba: Baraba, didFailWithError error: Error) {
        switch error {
        case BarabaError.cameraUnauthorized:
            ()
        case BarabaError.unsupportedConfiguration:
            ()
        default:
            ()
        }
    }
}
