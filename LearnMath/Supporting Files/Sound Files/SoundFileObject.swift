//
//  SoundFileObject.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 16/05/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox

class SoundFileObject: NSObject {
    
    
    var soundFileURLRef:CFURL!       // Audio
    var	soundFileObject:SystemSoundID = SystemSoundID()
    
    var dingsoundFileURLRef:CFURL!
    var	dingsoundFileObject:SystemSoundID = SystemSoundID()
    var	clicksoundFileURLRef:CFURL!
    var	clicksoundFileObject:SystemSoundID = SystemSoundID()
   	var	bangsoundFileURLRef:CFURL!
    var bangsoundFileObject:SystemSoundID = SystemSoundID()
    var	victorysoundFileURLRef:CFURL!
    var	victorysoundFileObject:SystemSoundID = SystemSoundID()
    var	wooshsoundFileURLRef:CFURL!
    var	wooshsoundFileObject:SystemSoundID = SystemSoundID()
    var	ffftsoundFileURLRef:CFURL!
    var	ffftsoundFileObject:SystemSoundID = SystemSoundID()
    
    
    // Create the URL for the source audio file.
    
    func audioSoundsFilesData()
    {
        // Create the URL for the source audio file.
        let bundle = Bundle.main
       // let quackSound:URL   = bundle.url(forResource: "Quack", withExtension: "wav")!
        let quackSound:URL   = bundle.url(forResource: "ohuh", withExtension: "wav")!
       // let dingSound:URL   = bundle.url(forResource: "Ding", withExtension: "aif")!
        let dingSound:URL   = bundle.url(forResource: "Girl Voice- yay", withExtension: "wav")!
        let clickSound:URL   = bundle.url(forResource: "tap", withExtension: "wav")!
        let bangSound:URL   = bundle.url(forResource: "Explosion3", withExtension: "wav")!
        let victorySound:URL   = bundle.url(forResource: "small_crowd_cheering_and_clapping", withExtension: "wav")!
       
        let wooshSound:URL   = bundle.url(forResource: "swoosh", withExtension: "wav")!
        let ffftSound:URL
            = bundle.url(forResource: "ffft", withExtension: "wav")!
        
        //Store the urls for the audio files
        soundFileURLRef = quackSound as CFURL!
        dingsoundFileURLRef = dingSound as
            CFURL!
        clicksoundFileURLRef = clickSound as CFURL!
        bangsoundFileURLRef = bangSound as CFURL!
        victorysoundFileURLRef = victorySound
            as CFURL!
        wooshsoundFileURLRef = wooshSound as CFURL!
        ffftsoundFileURLRef = ffftSound as CFURL!
        
       // create the sound object for the sound files
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundFileObject)
        
        AudioServicesCreateSystemSoundID(dingsoundFileURLRef, &dingsoundFileObject)
        
        AudioServicesCreateSystemSoundID(clicksoundFileURLRef, &clicksoundFileObject)
        
        AudioServicesCreateSystemSoundID(bangsoundFileURLRef, &bangsoundFileObject)
        
        AudioServicesCreateSystemSoundID(victorysoundFileURLRef, &victorysoundFileObject)
        
        AudioServicesCreateSystemSoundID(wooshsoundFileURLRef, &wooshsoundFileObject)
        
        AudioServicesCreateSystemSoundID(ffftsoundFileURLRef, &ffftsoundFileObject)
    }
    //Custom function used to remove the sounds
    func disposeAudioSoundsFilesData()
    {
        AudioServicesDisposeSystemSoundID(soundFileObject)
        AudioServicesDisposeSystemSoundID(dingsoundFileObject)
        AudioServicesDisposeSystemSoundID(clicksoundFileObject)
        AudioServicesDisposeSystemSoundID(bangsoundFileObject)
        AudioServicesDisposeSystemSoundID(victorysoundFileObject)
        AudioServicesDisposeSystemSoundID(wooshsoundFileObject)
        AudioServicesDisposeSystemSoundID(ffftsoundFileObject)

    }
}
