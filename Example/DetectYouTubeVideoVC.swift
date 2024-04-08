//
// DetectYouTubeVideoVC.swift
//
// Copyright (c) 2020 Soojin Ro (https://github.com/nsoojin)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit
import youtube_ios_player_helper
import Baraba
import AVFoundation
import AVKit
import WebKit


class DetectYouTubeVideoVC: UIViewController {

    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBOutlet weak var barabaButton: UIButton!
   
    
    let videoId = "https://www.youtube.com/watch?v=hTqtGJwsJVE".youtubeID
    
    
    let playerVars = [
                         "playsinline" : 0,
                         "showinfo" : 0,
                         "rel" : 0,
                         "modestbranding" : 1,
                         "controls" : 1,
                         "origin" : "https://www.youtube.com"
    ] as [String : Any]
    
    private var baraba: Baraba?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        playerView.load(withVideoId: videoId!,playerVars: playerVars)
        playerView.webView?.mediaPlaybackAllowsAirPlay = false
        
        
        barabaButton.setTitle("Pause", for: .normal)
        
        baraba = Baraba(configuration: .automatic)

        baraba?.delegate = self
        baraba?.resume()
        
      
    }
 

    @IBAction func barabaButtonPressed(_ sender: Any) {
        if baraba?.isActive == true {
            
            barabaButton.setTitle("Enable", for: .normal)
           
            baraba?.pause()
        } else {
            
            barabaButton.setTitle("Pause", for: .normal)
           
            baraba?.resume()
        }
    }
}



extension DetectYouTubeVideoVC: BarabaDelegate {
    func barabaDidStartVideo(_ baraba: Baraba) {
        
        playerView.playVideo()

        
    }
    
    func barabaDidStopVideo(_ baraba: Baraba) {
       
        playerView.pauseVideo()
        
        
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


extension String {
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/)|(?<=shorts/))([\\w-]++)"

        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)

        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }

        return (self as NSString).substring(with: result.range)
    }
}


