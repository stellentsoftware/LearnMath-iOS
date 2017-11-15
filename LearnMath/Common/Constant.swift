//
//  Constant.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/10/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

// This structure is used for identifieng the devices by using height.This structure is used in view controllers for adjusting the frames.
struct  DeviceModel
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad && SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO = UIDevice.current.userInterfaceIdiom == .pad && SCREEN_MAX_LENGTH == 1366.0
    static let kWLFontR = UIFont(name: "Marker SD", size: 16.0)
}

//This structure is used for getting the Appdelegate reference. By using the Appdelegate reference we can call function and variables which are in Appdelegate.
struct AppdelegateRef {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate// Appdelegate reference.
}

//This structure contains the viewcontroller identifiers,which are used for pushing from one view controller to another viewcontroller.
struct ViewControllerIdentifiers {
    
    static let kLongDivisionVC = "LongDivisionVC"
    static let kMenuVC = "MenuVC"
    static let kSpeedDrilVC = "SpeedDrillVC"
    static let kMultiAppVC = "MultiAppVC"
    static let kMathFactsVC = "MathFactsVC"
    
}
//This structure contains the alert text messages, which are used to display the text according to the ViewController.
struct Alerts{
    
    static let kMenuAlert = "-\"Level\" adjusts equation complexity\n\n - \"Numbers\" regulates introduction of primary digits\n\n - \"Category\" sets the math operator (or swipe up/down on exercise pages\n\n - \"Drill Timer\" sets time allowed to complete the \"Drill\"\n\n - \"# Questions\" determines how many questions are required."
    
    static let kLongDivisionAlert = "Enter digits in the proper sequence. No short cuts are allowed. Remember to provied remainders as needed."
    
    static let kMathFactsAlert = "This app implements the Learn Math method. There are three phases: Learn the Facts, Apply the Math, and Drill - with separate exercises for each. Swipe left and right to move between exercises. Within an exercise, swipe up and down to change operators. \n Info buttons on each page will help to guide you."
    
    static let kSpeedDrillAlert = "Solve the problems in this Drill as quickly as you can. Beat the timer and count of questions set in the Menu Options to \"win\".  Practicing with Drill builds \'automaticity\' - the ability to just know the answer without having to think about it."
    
    
    static let kMultiAppAlert = "After learning new learn math we apply them solving problems. This embeds them into our memory.\nFollow the Facts -> Application -> Drill sequence.\n\nFor addition and multiplication problems the \"carry\" function is handled much the same way you would do it on paper.  Just enter the correct sequence of digits. Regrouping in subtraction is similar. Just enter the correct sequence of digits."
    
}

// This structure is used to get the storyboard reference.
struct StoryBoards {
    
    static let kMainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    
}


// This structure is used to declare the sound object reference. By using this reference we can access the sound files in the Sound Object.
struct AudioFilesConstant {
    
    static let kSoundFileObject:SoundFileObject = SoundFileObject()
    
}

// This structure contains the array which is used in MathfactsVC.
struct Constant
{
    static let PositiveSayings:[String] = ["Good Work","Way to go","Super","You got it","Keep it up","You rock","That’s RIGHT!!","FANTASTIC!","Nice going","WOW!","Good for you!","Good thinking!","You’re learning fast!","Right on!","You’re the best!","Nice!","Great job!"]
    
    static let gifsArray:[String] = ["Panda1","Panda2","Panda3"]
}
//This structure contains the color references which are used for changing the background colors for the buttons in MenuVC.
struct TextColors
{
    static let kBrownTextColor = UIColor(red: 126.0/255.0, green: 107.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    static let kWhiteColor = UIColor.white
}


