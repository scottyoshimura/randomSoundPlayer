//
//  ViewController.swift
//  randomSound
//
//  Created by Scott Yoshimura on 5/15/15.
//  Copyright (c) 2015 west coast dev. All rights reserved.
//
// this app will play a random sound whenever the device is shook


import UIKit
import AVFoundation

class ViewController: UIViewController {

    //lets create our audio player
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    //lets create an array of the main file names to support the random selecter
    var soundNames = ["explosion","level","missile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //this is called anytime the movement of the iphone moves. override just means we are adding some code to it
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        //we want to see if hte user has just shaken their phone
        if event.subtype == UIEventSubtype.MotionShake {
            
            //lets set up the random logic
            //lets set up a random number variable using arc4random_uniform and sending it soundNames.count after it is converted to UInt32.
                //further, random number needs to be an int.
            
            println("user shook the device")
            
            var randomNumber = Int(arc4random_uniform(UInt32(soundNames.count)))
            
            //lets set up our file location
            var fileLocation = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundNames[randomNumber], ofType: "wav")!)
            //lets set up the error message
            var errorMessage:NSError? = nil
            //lets grab the audio player and send it a file path
            audioPlayer = AVAudioPlayer(contentsOfURL: fileLocation, error: &errorMessage)            //lets call the audio player to play
            audioPlayer.play()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

