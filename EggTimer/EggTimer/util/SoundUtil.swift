//
//  SoundUtil.swift
//  EggTimer
//
//  Created by Elias Ferreira on 14/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

public class SoundUtil {
    var player: AVAudioPlayer?
    
    public func playSound(soundResource: String)  {
        let url = Bundle.main.url(forResource: soundResource, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
