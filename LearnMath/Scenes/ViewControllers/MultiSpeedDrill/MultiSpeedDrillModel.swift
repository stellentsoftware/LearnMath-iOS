//
//  MultiSpeedDrillModel.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/13/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
class MultiSpeedDrillModel{
    
    let APPDELEGATE = AppdelegateRef.appDelegate
    var multiDrillVCDelegate:MultiSpeedDrillViewController!
    
    // Custom method to add the additional design for the images , frames and to load some extra functions etc.
    func initialloading()
    {
        multiDrillVCDelegate.popOverView.isHidden = true
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
             multiDrillVCDelegate.popOverView.frame = CGRect(x: multiDrillVCDelegate.popOverView.frame.origin.x, y: 0, width: multiDrillVCDelegate.popOverView.frame.size.width, height: multiDrillVCDelegate.popOverView.frame.size.height+20)
            
            multiDrillVCDelegate.headerView.frame = CGRect(x: multiDrillVCDelegate.headerView.frame.origin.x, y: multiDrillVCDelegate.headerView.frame.origin.y-5, width: multiDrillVCDelegate.headerView.frame.size.width, height: multiDrillVCDelegate.headerView.frame.size.height)
            
            multiDrillVCDelegate.pageControl.frame =  CGRect(x:  multiDrillVCDelegate.headerView.center.x-5, y: multiDrillVCDelegate.headerView.frame.origin.y+multiDrillVCDelegate.fluencyLbl.frame.size.height+5, width: 10, height:1)
            
            multiDrillVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            multiDrillVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 300)
        }
        addAnimationImagestoArray()//Adding the animation images to the array

        multiDrillVCDelegate.countStr = NSMutableAttributedString(string: " Count", attributes: [NSFontAttributeName:UIFont(name: "Youre So Cool", size: 17.0)!])
        multiDrillVCDelegate.countStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(colorLiteralRed: 139.0/255.0, green: 177.0/255.0, blue: 204.0/255.0, alpha: 1.0), range: NSRange(location:1,length:(String("Count")?.characters.count)!))
        
        multiDrillVCDelegate.timeStr = NSMutableAttributedString(string: "Time ", attributes: [NSFontAttributeName:UIFont(name: "Youre So Cool", size: 17.0)!])
        multiDrillVCDelegate.timeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(colorLiteralRed: 139.0/255.0, green: 177.0/255.0, blue: 204.0/255.0, alpha: 1.0), range: NSRange(location:0,length:(String("Time")?.characters.count)!))
        
         // Custom Method to initialize the swipe Gestures to all directions in the view.
        self.callGestures() //

        //Retriving  the mathfacts level, category, range, category, questions max limit , timer max limit values from plist and assigning to the variables.
        
        multiDrillVCDelegate.mfLevel = APPDELEGATE.MathFactsLevel
        multiDrillVCDelegate.questionMax = APPDELEGATE.MathFactsQuestionMax
        multiDrillVCDelegate.mfRange = APPDELEGATE.MathFactsRange
        multiDrillVCDelegate.questionCategory = APPDELEGATE.MathFactsCatagory
        multiDrillVCDelegate.timerMax = APPDELEGATE.MathFactsTimerMax
        multiDrillVCDelegate.timeRemaining = multiDrillVCDelegate.timerMax
        countlblDisplay(totalcount: String(multiDrillVCDelegate.timeRemaining))
     // Method for custom design
        self.setImages()
        // Method to get the numbers randomly in the selected range for the operation.
        multiDrillVCDelegate.getNewNumbers()
    }
    //Setting the math operator images and animation images
    func setImages()
    {
        multiDrillVCDelegate.divBox.isHidden = true
        // Explosion image setup (hidden)
        multiDrillVCDelegate.explosionImage = UIImageView(image:UIImage(named:"explosionTransparent.png")!)
        let r = UIScreen.main.bounds
        multiDrillVCDelegate.explosionImage.frame = r
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.explosionImage)
        multiDrillVCDelegate.explosionImage.isHidden = true
        
        // Cloud image setup
        multiDrillVCDelegate.cloudImage = UIImageView(image:UIImage(named:"Cloud.png")!)
        let r2 = UIScreen.main.bounds
        multiDrillVCDelegate.cloudImage.frame = r2
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.cloudImage)
        multiDrillVCDelegate.cloudImage.isHidden = true
        
        let xVal = (DeviceModel.SCREEN_WIDTH-150)/2
        let yVal = 92.5 //30

        multiDrillVCDelegate.iconPlusSignLarge =            UIImageView.init(image:#imageLiteral(resourceName: "Plus205x205dot"))
        let LPlusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiDrillVCDelegate.iconPlusSignLarge.frame = LPlusRect
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.iconPlusSignLarge)
        multiDrillVCDelegate.iconPlusSignLarge.isHidden = false
        multiDrillVCDelegate.iconPlusSignLarge.alpha = 0.0
        
        
        multiDrillVCDelegate.iconMinusSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Minus205x205dot"))
        let LMinusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiDrillVCDelegate.iconMinusSignLarge.frame = LMinusRect
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.iconMinusSignLarge)
        multiDrillVCDelegate.iconMinusSignLarge.isHidden = false
        multiDrillVCDelegate.iconMinusSignLarge.alpha = 0.0
        
        
        multiDrillVCDelegate.iconTimesSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Times205x205dot"))
        let LTimesRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiDrillVCDelegate.iconTimesSignLarge.frame = LTimesRect
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.iconTimesSignLarge)
        multiDrillVCDelegate.iconTimesSignLarge.isHidden = false
        multiDrillVCDelegate.iconTimesSignLarge.alpha = 0.0
        
        multiDrillVCDelegate.iconDivideSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Divide205x205dot"))
        
        let LDivRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiDrillVCDelegate.iconDivideSignLarge.frame = LDivRect
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.iconDivideSignLarge)
        multiDrillVCDelegate.iconDivideSignLarge.isHidden = false
        multiDrillVCDelegate.iconDivideSignLarge.alpha = 0.0
    }
     // Custom Method to initialize the swipe Gestures to all directions in the view.
    func callGestures()
    {
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiDrillVCDelegate, action: #selector(multiDrillVCDelegate.swipeLeft))
        swipeLeft.direction = .left
        multiDrillVCDelegate.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiDrillVCDelegate, action: #selector(multiDrillVCDelegate.swipeRight))
        swipeRight.direction = .right
        multiDrillVCDelegate.view.addGestureRecognizer(swipeRight)
        
        // Swipe up
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiDrillVCDelegate, action: #selector(multiDrillVCDelegate.swipeUp))
        swipeUp.direction = .up
        multiDrillVCDelegate.view.addGestureRecognizer(swipeUp)
        
        
        // Swipe Down
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiDrillVCDelegate, action: #selector(multiDrillVCDelegate.swipeDown))
        swipeDown.direction = .down
        multiDrillVCDelegate.view.addGestureRecognizer(swipeDown)
        
        //TapGesture for PopView
        let popViewtapgeasture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: multiDrillVCDelegate, action: #selector(multiDrillVCDelegate.alertCloseBtnAction))
        popViewtapgeasture.numberOfTapsRequired = 1;
        multiDrillVCDelegate.popOverView .addGestureRecognizer(popViewtapgeasture)
    }
    //Custom Method for displaying math operators while swiping up and down directions.
    func flashIcon()
    {
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.ffftsoundFileObject)
        
        switch (multiDrillVCDelegate.questionCategory) {  // Selective call teh method to flash up the current Operator
        case 0: multiDrillVCDelegate.iconCurrentSignLarge = multiDrillVCDelegate.iconPlusSignLarge
            break
        case 1: multiDrillVCDelegate.iconCurrentSignLarge = multiDrillVCDelegate.iconMinusSignLarge
            break
        case 2: multiDrillVCDelegate.iconCurrentSignLarge = multiDrillVCDelegate.iconTimesSignLarge
            break
        case 3: multiDrillVCDelegate.iconCurrentSignLarge = multiDrillVCDelegate.iconDivideSignLarge
            break
        default: break
        }
        UIView.beginAnimations("fade in image", context: nil)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationCurve(.easeIn)
        multiDrillVCDelegate.iconCurrentSignLarge.alpha = 1.0
        UIView.setAnimationDelegate(multiDrillVCDelegate)
        UIView.setAnimationDidStop(#selector(multiDrillVCDelegate.fadeInAnimationFinished(animationID:finished:context:)))
        UIView.commitAnimations()
    }
    // Custom method to start the fade out animation to dismis the selected flash image
    func fadeInAnimationFinished(animationID:String,finished:NSNumber,context:UnsafeMutableRawPointer)
    {
        UIView.beginAnimations("fade out image", context: nil)
        UIView.setAnimationDelay(0.5)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationCurve(.easeInOut)
        // On occasion an icon would not get Faded out and would stay up until it specifically was rendered again and faded out.
        // So, now fade all icons (not just the current one) to catch any that might have been left behind
        //// iconCurrentSignLarge.alphac
        multiDrillVCDelegate.iconPlusSignLarge.alpha = 0.0
        multiDrillVCDelegate.iconMinusSignLarge.alpha = 0.0
        multiDrillVCDelegate.iconTimesSignLarge.alpha = 0.0
        multiDrillVCDelegate.iconDivideSignLarge.alpha = 0.0
        UIView.commitAnimations()
    }

    
    //Custom method to show timer countdown
    func countdown()
    {
             //Track event related to the count down timer
            if multiDrillVCDelegate.timeRemaining > 0
            {
                multiDrillVCDelegate.timeRemaining = multiDrillVCDelegate.timeRemaining-1
                multiDrillVCDelegate.progressView.progress = Float(multiDrillVCDelegate.progressView.progress + (1/Float(multiDrillVCDelegate.timerMax)))
                countlblDisplay(totalcount: String(multiDrillVCDelegate.timeRemaining))
            }
            if (multiDrillVCDelegate.timeRemaining <= 0) {
                
                if (multiDrillVCDelegate.CountInt < multiDrillVCDelegate.questionMax )
                {   // Not enough questions answered in time allowed
                    
                    multiDrillVCDelegate.progressView.progress = 1
                    // Display "out of time" image
                    multiDrillVCDelegate.explosionImage.isHidden = false
                    multiDrillVCDelegate.explosionImage.alpha = 1.0
                    // Explosion sounds
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.bangsoundFileObject)
                    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate)
                    multiDrillVCDelegate.timer.invalidate()
                    
                    multiDrillVCDelegate.imageSequencer1 = Timer.scheduledTimer(timeInterval: 0.1, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.cloudReveal), userInfo: nil, repeats: false)
                    
                     multiDrillVCDelegate.imageSequencer2 = Timer.scheduledTimer(timeInterval: 0.2, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.explosionHide), userInfo: nil, repeats: false)
                    
                     multiDrillVCDelegate.imageSequencer3 = Timer.scheduledTimer(timeInterval: 0.3, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.cloudHide), userInfo: nil, repeats: false)
                    
                     multiDrillVCDelegate.imageSequencer4 = Timer.scheduledTimer(timeInterval: 0.2, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
                 } else {
                    // Success - enough questions were answerd before the timer expired!!!
                    multiDrillVCDelegate.progressView.progress = 1
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.victorysoundFileObject)
                    successResponseAnimation()
                    
                }
                multiDrillVCDelegate.timer.invalidate()

                 multiDrillVCDelegate.timeRemaining =  multiDrillVCDelegate.timerMax
                 multiDrillVCDelegate.CountInt = 0
                
                 let counterstr = String(multiDrillVCDelegate.CountInt)+"/"+String(multiDrillVCDelegate.questionMax)   //Display count
                
                counterlblDisplay(counter: counterstr)
                countlblDisplay(totalcount: String(multiDrillVCDelegate.timerMax))
            }
    }
    // Custom method to get the random numbers by using the level which was user selected.
    func getNewNumbers()
    {
        
        if multiDrillVCDelegate.questionCategory == 3
        {
            multiDrillVCDelegate.answerLbl.backgroundColor = UIColor.clear
            multiDrillVCDelegate.answerLbl.isHidden = true
            multiDrillVCDelegate.divisionAnswerLbl.isHidden = false
         } else {
            multiDrillVCDelegate.divisionAnswerLbl.backgroundColor = UIColor.clear
            multiDrillVCDelegate.answerLbl.isHidden = false
            multiDrillVCDelegate.divisionAnswerLbl.isHidden = true
        }
        var tempNum:Int = 1
        var indexToRndArray:Int = 1
        print(indexToRndArray)
        // Clear Div signs
        multiDrillVCDelegate.divBox.isHidden = true
        multiDrillVCDelegate.divisionAnswerLbl.text = ""
        
        switch (multiDrillVCDelegate.mfLevel) { //MathFacts Level
        case 0: //Level 1
            
            switch (multiDrillVCDelegate.questionCategory) {  // Math Opperation
            case 0: // Addition
                repeat {
                    indexToRndArray = APPDELEGATE.RandomNumInRange
                    multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                    multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal
                } while ((multiDrillVCDelegate.equationFirstNum + multiDrillVCDelegate.equationSecondNum) > 9)
                break
                
            case 1: // Subtraction
                indexToRndArray = APPDELEGATE.RandomNumInRange
                 multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                 multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal

                if (multiDrillVCDelegate.equationFirstNum < multiDrillVCDelegate.equationSecondNum) {  // then reverse the order
                    multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumFirstVal
                    multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumSecondVal
                }  // Ensures no negative numbers
                break
            case 2,3: // Division,Multiplication  (same with Division)
                repeat {
                    indexToRndArray = APPDELEGATE.RandomNumInRange
                    multiDrillVCDelegate.equationFirstNum   = APPDELEGATE.RandomNumSecondVal
                    multiDrillVCDelegate.equationSecondNum  = APPDELEGATE.RandomNumFirstVal
                } while ((multiDrillVCDelegate.equationFirstNum * multiDrillVCDelegate.equationSecondNum) > 9)
                multiDrillVCDelegate.equationFirstNum = multiDrillVCDelegate.equationFirstNum * multiDrillVCDelegate.equationSecondNum
                break
            default:
                break
            }
            break

        case 1,2,3: //Level 4 - Allows for carry on Mult and Add
            switch (multiDrillVCDelegate.questionCategory)
            {  // Math Opperation
            case 0: // Addition
                indexToRndArray = APPDELEGATE.RandomNumInRange
                multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal
                break
            case 1: // Subtraction
                indexToRndArray = APPDELEGATE.RandomNumInRange
                multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal
                
                if ( multiDrillVCDelegate.equationFirstNum <  multiDrillVCDelegate.equationSecondNum) {  // then reverse the order
                     multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumFirstVal
                     multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumSecondVal
                }  // Ensures no negative numbers
                break
                
            case 2: // Multiplication
                indexToRndArray = APPDELEGATE.RandomNumInRange
                multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal
                break
                
            case 3: // Division
                indexToRndArray = APPDELEGATE.RandomNumInRange
                multiDrillVCDelegate.equationSecondNum = APPDELEGATE.RandomNumSecondVal
                multiDrillVCDelegate.equationFirstNum = APPDELEGATE.RandomNumFirstVal
                break
            default:
                break
            }
            break
            
        default:// (mfLevel) MathFacts Level
            break
        }
        switch (multiDrillVCDelegate.questionCategory) {
        case 0: // Addition
            multiDrillVCDelegate.mathOppStr = "+"
            multiDrillVCDelegate.calculatedAnswer = multiDrillVCDelegate.equationFirstNum + multiDrillVCDelegate.equationSecondNum
            // Randomly assign the 'target' digit to the first or second position in the equation
            let intval:Int = Int(arc4random_uniform(2))
            if Bool(intval as NSNumber)
            {
                tempNum = multiDrillVCDelegate.equationFirstNum
                multiDrillVCDelegate.equationFirstNum = multiDrillVCDelegate.equationSecondNum
                multiDrillVCDelegate.equationSecondNum = tempNum
            }
            break
            
        case 1: // Subtraction requested but give them Multiplication
            multiDrillVCDelegate.mathOppStr = "-"
            multiDrillVCDelegate.calculatedAnswer = multiDrillVCDelegate.equationFirstNum - multiDrillVCDelegate.equationSecondNum
            break
            
        case 2: // Multiplication
             multiDrillVCDelegate.mathOppStr = "×"
             multiDrillVCDelegate.calculatedAnswer =  multiDrillVCDelegate.equationFirstNum *  multiDrillVCDelegate.equationSecondNum
            // Randomly assign the 'target' digit to the first or second position in the equation
             let intval2:Int = Int(arc4random_uniform(2))
            if Bool(intval2 as NSNumber)
            {
                tempNum =  multiDrillVCDelegate.equationFirstNum
                 multiDrillVCDelegate.equationFirstNum =  multiDrillVCDelegate.equationSecondNum
                 multiDrillVCDelegate.equationSecondNum = tempNum
            }
            break
            
        case 3: // Division

            multiDrillVCDelegate.mathOppStr = ""
             multiDrillVCDelegate.calculatedAnswer =  multiDrillVCDelegate.equationSecondNum
             multiDrillVCDelegate.equationSecondNum =  multiDrillVCDelegate.equationFirstNum *  multiDrillVCDelegate.equationSecondNum
            if ( multiDrillVCDelegate.equationSecondNum > 9)
            {
                 multiDrillVCDelegate.divBox.isHidden = false
             } else {
                 multiDrillVCDelegate.divBox.isHidden = false
            }
            break
            
        default:
            break
        }
        // Display composite equation
        if ( multiDrillVCDelegate.questionCategory == 3)
        { // Special case for Division
            if(multiDrillVCDelegate.equationSecondNum > 9)
            {
               multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+" "+multiDrillVCDelegate.mathOppStr+" "+String(multiDrillVCDelegate.equationSecondNum)
                multiDrillVCDelegate.answerLbl.text = ""

             } else {
                multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+" "+multiDrillVCDelegate.mathOppStr+" "+String(multiDrillVCDelegate.equationSecondNum)
                 multiDrillVCDelegate.answerLbl.text = ""
            }
         } else {
            multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+"  "+multiDrillVCDelegate.mathOppStr+"  "+String(multiDrillVCDelegate.equationSecondNum)+"  =   "
            multiDrillVCDelegate.answerLbl.text = ""
        }
        // Calculate all response digits here
        multiDrillVCDelegate.calcOnes  = multiDrillVCDelegate.calculatedAnswer % 10
        multiDrillVCDelegate.calcTens  = (multiDrillVCDelegate.calculatedAnswer / 10) % 10
        multiDrillVCDelegate.calcHuns  = (multiDrillVCDelegate.calculatedAnswer / 100) % 10
        multiDrillVCDelegate.calcThous = (multiDrillVCDelegate.calculatedAnswer / 1000) % 10
        
        // Set initial input phase based on the randomly generated equation
        if (multiDrillVCDelegate.calculatedAnswer > 9999) {
            multiDrillVCDelegate.inputPhase = 999999999 // Error condition
        } else if (multiDrillVCDelegate.calculatedAnswer > 999) {
          multiDrillVCDelegate.inputPhase = 3
        } else if (multiDrillVCDelegate.calculatedAnswer > 99)  {
          multiDrillVCDelegate.inputPhase = 2
        } else if (multiDrillVCDelegate.calculatedAnswer > 9)   {
          multiDrillVCDelegate.inputPhase = 1
         } else {
            multiDrillVCDelegate.inputPhase = 0
        }
        let counterstr = String(multiDrillVCDelegate.CountInt)+"/"+String(multiDrillVCDelegate.questionMax)
        counterlblDisplay(counter: counterstr)
    }
    // Custom method to do the functionality of the arithmetic operation according to the button was selected in the number pad. If user selects the correct answer it will go to the next step of arithmetic operation otherwise gives a error sound.

    func buttonDigitPressed(sender: UIButton)
    {
        switch (multiDrillVCDelegate.inputPhase) {
        // Ones Place
        case 0:
            if (sender.tag == multiDrillVCDelegate.calcOnes)
            {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject);
                // CR 11/26/2011 change format of division equation (no "=" sign)
                if (multiDrillVCDelegate.questionCategory == 3) {
                    if (multiDrillVCDelegate.equationSecondNum < 10) { //Answer centered over the ones place
                        multiDrillVCDelegate.divisionAnswerLbl.text = "  "+String(multiDrillVCDelegate.calculatedAnswer)+" "
                     } else {  // Answer centered over the tens place
                         multiDrillVCDelegate.divisionAnswerLbl.text = "  "+String(multiDrillVCDelegate.calculatedAnswer)
                    }
                 } else {
                
                     multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+"  "+multiDrillVCDelegate.mathOppStr+"  "+String(multiDrillVCDelegate.equationSecondNum)+"  =   "
                    multiDrillVCDelegate.answerLbl.text = String(multiDrillVCDelegate.calculatedAnswer)
                }
                multiDrillVCDelegate.CountInt = multiDrillVCDelegate.CountInt+1
                
               multiDrillVCDelegate.inputPhase = 999  // set invalid phase # until new equation is ready (fixed bug allowing repeated single answers to accrue 'points'
                let counterstr = String(multiDrillVCDelegate.CountInt)+"/"+String(multiDrillVCDelegate.questionMax)
                counterlblDisplay(counter: counterstr)
                  //Display count Facts
                multiDrillVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 1, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject);
            }
            break;
            
        case 1:
            if (sender.tag == multiDrillVCDelegate.calcTens) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject); // key click
        multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+"  "+multiDrillVCDelegate.mathOppStr+"  "+String(multiDrillVCDelegate.equationSecondNum)+"  =   "
                
                multiDrillVCDelegate.answerLbl.text = String(multiDrillVCDelegate.calculatedAnswer / 10)
                
                multiDrillVCDelegate.inputPhase = 0;
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject);
            }
            break;
            
        case 2:  //Hundreds place
            if (sender.tag == multiDrillVCDelegate.calcHuns)
            {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject); // key click
        multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+"  "+multiDrillVCDelegate.mathOppStr+"  "+String(multiDrillVCDelegate.equationSecondNum)+"  =   "
                
                multiDrillVCDelegate.answerLbl.text = String(multiDrillVCDelegate.calculatedAnswer / 100)
                multiDrillVCDelegate.inputPhase = 1;
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject);
            }
            break;
        case 3: //Thousands place
            if (sender.tag == multiDrillVCDelegate.calcThous)
            {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject); // key click
        multiDrillVCDelegate.equationLbl.text = String(multiDrillVCDelegate.equationFirstNum)+"  "+multiDrillVCDelegate.mathOppStr+"  "+String(multiDrillVCDelegate.equationSecondNum)+"  =   "
                
            multiDrillVCDelegate.answerLbl.text = String(multiDrillVCDelegate.calculatedAnswer / 1000)

                multiDrillVCDelegate.inputPhase = 2;
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject);
            }
            break;
        default:
            break;
        }
        if (multiDrillVCDelegate.timeRemaining == multiDrillVCDelegate.timerMax) {
            multiDrillVCDelegate.timeRemaining=multiDrillVCDelegate.timeRemaining-1;
            multiDrillVCDelegate.progressView.progress = 0
             multiDrillVCDelegate.progressView.progress = Float(multiDrillVCDelegate.progressView.progress + (1/Float(multiDrillVCDelegate.timerMax)))
            multiDrillVCDelegate.timer=Timer.scheduledTimer(timeInterval: 1.0, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.countdown), userInfo: nil, repeats: true)
        }
    }
    //This function is called when home button is selected for displaying the Animation in MathFactsViewController
    func homeButtonAction(sender: UIButton)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers
            .kMathFactsVC) as! MathFactsViewController
        AppdelegateRef.appDelegate.islaunch = true
        multiDrillVCDelegate.present(nextVC, animated: false, completion: nil)
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
    }
     // Custom method to push to the `MathFactsVC` when user swipes Left side.
    func handleSwipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMathFactsVC) as! MathFactsViewController
        nextVC.modalTransitionStyle = .flipHorizontal
         AppdelegateRef.appDelegate.islaunch = false
        multiDrillVCDelegate.present(nextVC, animated: true, completion: nil)
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
    }
     // Custom method to push to the `LongDivisionVC or MultiAppView ` when user swipes Right side.
    func handleSwipeRight(recognizer:UISwipeGestureRecognizer)
    {
        if (multiDrillVCDelegate.questionCategory == 3) {
            
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kLongDivisionVC) as! LongDivisionViewController
            nextVC.modalTransitionStyle = .flipHorizontal
            multiDrillVCDelegate.present(nextVC, animated: true, completion: nil)
       } else {
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMultiAppVC) as! MultiAppViewController
            nextVC.modalTransitionStyle = .flipHorizontal
            multiDrillVCDelegate.present(nextVC, animated: true, completion: nil)
        }
         AppdelegateRef.appDelegate.islaunch = false
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
    }
// Custom method to get the new random numbers and changing the math operator when user swipes up side.
    func handleSwipeUp(recognizer:UISwipeGestureRecognizer)
    {
        
        multiDrillVCDelegate.questionCategory = multiDrillVCDelegate.questionCategory+1;
        if (multiDrillVCDelegate.questionCategory > 3) {  // Wrap through Add > Sub > Mult >  Div around to Add...
            multiDrillVCDelegate.questionCategory = 0;
        }
        self.flashIcon(); /// to flash up the new math operator sign briefly
        //  Start timer to get new numbers
        multiDrillVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
        APPDELEGATE.setMathFactsCatagory(newCatagory: multiDrillVCDelegate.questionCategory)
    }
    // Custom method to get the new random numbers and changing the math operator when user swipes down side.
    func handleSwipeDown(recognizer:UISwipeGestureRecognizer)
    {
        multiDrillVCDelegate.questionCategory = multiDrillVCDelegate.questionCategory-1;
        if (multiDrillVCDelegate.questionCategory < 0) {  // Wrap through Add > Sub > Mult >  Div around to Add...
            multiDrillVCDelegate.questionCategory = 3;
        }
        self.flashIcon() /// to flash up the new math operator sign briefly
        
        //  Start timer to get new numbers
        multiDrillVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: multiDrillVCDelegate, selector: #selector(multiDrillVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
        APPDELEGATE.setMathFactsCatagory(newCatagory: multiDrillVCDelegate.questionCategory)
    }
    // Custom method to show the popView with the relavent data about the view controller and it's usage.
    func showSpeedDrillInfo()
    {
        // multiDrillVCDelegate.timer.invalidate()
        multiDrillVCDelegate.popOverView.isHidden = false
        multiDrillVCDelegate.view.bringSubview(toFront: multiDrillVCDelegate.popOverView)
       
    }
    // Custom method to present the `MenuViewController`. Which is used to select the level, category and the number range.
    func buttonMenuView()
    {
        
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMenuVC) as! MenuViewController
        multiDrillVCDelegate.present(nextVC, animated: true, completion: nil)
    }
    //Applying the color and displaying the questions label
    func countlblDisplay(totalcount:String)
    {
      
        multiDrillVCDelegate.timeStr = NSMutableAttributedString(string: "Time ", attributes: [NSFontAttributeName:UIFont(name: "Youre So Cool", size: 17.0)!])
        
        multiDrillVCDelegate.timeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(colorLiteralRed: 139.0/255.0, green: 177.0/255.0, blue: 204.0/255.0, alpha: 1.0), range: NSRange(location:0,length:(String("Time")?.characters.count)!))
        
        multiDrillVCDelegate.secondsLbl.text = ""
        let timestr = NSMutableAttributedString(string: totalcount)
        multiDrillVCDelegate.timeStr.append(timestr)
        multiDrillVCDelegate.secondsLbl.attributedText = multiDrillVCDelegate.timeStr
    }
    //Applying the color and displaying the timer countdown label
    func counterlblDisplay(counter:String)
    {
        let str = NSMutableAttributedString(string: counter)
        str.append(multiDrillVCDelegate.countStr)
        multiDrillVCDelegate.counterLbl.attributedText = str
    }
    //Custom method used for adding the animation images to the Array
    func addAnimationImagestoArray()
    {
      //  multiDrillVCDelegate.cheerView
        for i in 1...12
        {
            let animationImage:UIImage = UIImage.init(named: "Success"+String(i))!
            multiDrillVCDelegate.animationImagesArray.append(animationImage)
        }
        multiDrillVCDelegate.cheerView.config.particle = .image(multiDrillVCDelegate.animationImagesArray)
        multiDrillVCDelegate.view.addSubview(multiDrillVCDelegate.cheerView)
    }
    
    func viewDidLayoutSubviews()
    {
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
            multiDrillVCDelegate.firstView.frame = CGRect(x: multiDrillVCDelegate.firstView.frame.origin.x, y: multiDrillVCDelegate.firstView.frame.origin.y, width: multiDrillVCDelegate.firstView.frame.size.width, height:69)
            multiDrillVCDelegate.secondView.frame = CGRect(x: multiDrillVCDelegate.secondView.frame.origin.x, y: multiDrillVCDelegate.secondView.frame.origin.y, width: multiDrillVCDelegate.secondView.frame.size.width, height:69)
            multiDrillVCDelegate.thirdView.frame = CGRect(x: multiDrillVCDelegate.thirdView.frame.origin.x, y: multiDrillVCDelegate.thirdView.frame.origin.y, width: multiDrillVCDelegate.thirdView.frame.size.width, height:69)
            multiDrillVCDelegate.fourthView.frame = CGRect(x: multiDrillVCDelegate.fourthView.frame.origin.x, y: multiDrillVCDelegate.fourthView.frame.origin.y, width: multiDrillVCDelegate.fourthView.frame.size.width, height:69)
            
            multiDrillVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            multiDrillVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 350)
            
        }
    }
    //Custom method used for displaying the success response animation Images.
    func successResponseAnimation()
    {
        multiDrillVCDelegate.cheerView.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.multiDrillVCDelegate.progressView.progress = 0
            self.multiDrillVCDelegate.cheerView.stop()
        }
    }
}
