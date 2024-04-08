//
// VideoPlayerView.swift
//


import UIKit
import AVFoundation

class VideoPlayerView: UIView {

    var player: AVPlayer?
      
      func setupPlayer(with url: URL) {
          player = AVPlayer(url: url)
          
          let playerLayer = AVPlayerLayer(player: player)
          playerLayer.frame = bounds
          layer.addSublayer(playerLayer)
      }
      
      func play() {
          player?.play()
      }
      
      func pause() {
          player?.pause()
      }

}
