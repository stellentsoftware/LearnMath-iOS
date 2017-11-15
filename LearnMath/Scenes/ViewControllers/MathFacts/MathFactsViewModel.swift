//
//  MathFactsViewModel.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/11/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
class MathFactsViewModel
{
    
    
    //let APPDELEGATE = AppdelegateRef.appDelegate
    var mathsFactsVCDelegate:MathFactsViewController!
    
    //MARK:- Custom Methods
    
    // Custom method to add the additional design for the images , frames and to load some extra functions etc.
    func initialloading()
    {
        mathsFactsVCDelegate.couchmarkView.isHidden = true
        mathsFactsVCDelegate.popOverView.isHidden = true
        mathsFactsVCDelegate.animationView.isHidden = true
        for index in 0...2 {
               //var imageData:Data!
             let imageData = try! Data(contentsOf: Bundle.main.url(forResource: Constant.gifsArray[index], withExtension: "gif")!)
            mathsFactsVCDelegate.gifImagesArray.append(imageData)
            }
        
        // Do any additional setup after loading the view, typically from a nib.
        viewWillLayoutSubviews()
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
            mathsFactsVCDelegate.headerView.frame = CGRect(x: mathsFactsVCDelegate.headerView.frame.origin.x, y: mathsFactsVCDelegate.headerView.frame.origin.y-5, width: mathsFactsVCDelegate.headerView.frame.size.width, height: mathsFactsVCDelegate.headerView.frame.size.height)
            
             mathsFactsVCDelegate.popOverView.frame = CGRect(x: mathsFactsVCDelegate.popOverView.frame.origin.x, y: 0, width: mathsFactsVCDelegate.popOverView.frame.size.width, height: mathsFactsVCDelegate.popOverView.frame.size.height)
            
            mathsFactsVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            mathsFactsVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 350)
            mathsFactsVCDelegate.pageControl.frame =  CGRect(x:  mathsFactsVCDelegate.headerView.center.x-5, y: mathsFactsVCDelegate.headerView.frame.origin.y+mathsFactsVCDelegate.learnFactsLbl.frame.size.height+5, width: 10, height:1)
        }

        callGestures()
        callDisplayImages()
        
        if (AppdelegateRef.appDelegate.MathFactsIsCurrent > 0)
        {
            // Getting current vars from App Delegate
            mathsFactsVCDelegate.selectedLevel =           AppdelegateRef.appDelegate.MathFactsLevel
            
            mathsFactsVCDelegate.selectedNumberRange =     AppdelegateRef.appDelegate.MathFactsRange

            mathsFactsVCDelegate.selectedSegmentBasics =     AppdelegateRef.appDelegate.MathFactsCatagory
            
            mathsFactsVCDelegate.sliderTimerValue =          AppdelegateRef.appDelegate.MathFactsTimerMax
            mathsFactsVCDelegate.sliderQuestionCountValue =  AppdelegateRef.appDelegate.MathFactsQuestionMax
            
            mathsFactsVCDelegate.spinningIconUp = false
         } else {
            
            mathsFactsVCDelegate.spinningIconUp = true
            // Else this is first time and we need to read from the P-list and update App Delegate
            // Setup path to data stored in the data.plist
            //let error: NSError!
            
            let fileManager = FileManager.default
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let path = documentDirectory.appendingFormat("/data.plist")
            
            if(!fileManager.fileExists(atPath: path))
            {
                let bundle: String = Bundle.main.path(forResource: "data", ofType: "plist")!
                do{
                    try fileManager.copyItem(atPath: bundle, toPath: path)
                }catch
                {}
             } else {
            }
            //Read saved data from data.plist
            
            let savedAppData = NSDictionary(contentsOfFile: path)
            if let _ = savedAppData?.object(forKey: "NumSet")
            {
                mathsFactsVCDelegate.selectedNumberRange = savedAppData?.object(forKey: "NumSet") as! Int
            }
            
            if let _ = savedAppData?.object(forKey: "mathLevel")
            {
                mathsFactsVCDelegate.selectedLevel = savedAppData?.object(forKey: "mathLevel") as! Int
            }
            if let _ = savedAppData?.object(forKey: "Basics")
            {
                mathsFactsVCDelegate.selectedSegmentBasics = savedAppData?.object(forKey: "Basics") as! Int
            }
            
            if let _ = savedAppData?.object(forKey: "sliderTimer")
            {
                mathsFactsVCDelegate.sliderTimerValue = savedAppData?.object(forKey: "sliderTimer") as! Int
            }
            if let _ = savedAppData?.object(forKey: "sliderQuestions")
            {
                mathsFactsVCDelegate.sliderQuestionCountValue = savedAppData?.object(forKey: "sliderQuestions") as! Int
            }
            if (mathsFactsVCDelegate.sliderTimerValue == 0)
            {
                mathsFactsVCDelegate.sliderTimerValue = 60 // Makes no sense for it to be set to 0
            }
            //Store data retrieved from the Plist to the App Delegate so other views can reference it.
            AppdelegateRef.appDelegate.MathFactsLevel = mathsFactsVCDelegate.selectedLevel
            AppdelegateRef.appDelegate.SetMathFactsRange(newRange: mathsFactsVCDelegate.selectedNumberRange)
            
            AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: mathsFactsVCDelegate.selectedSegmentBasics)
            
            AppdelegateRef.appDelegate.MathFactsTimerMax = mathsFactsVCDelegate.sliderTimerValue
            
            AppdelegateRef.appDelegate.MathFactsQuestionMax = mathsFactsVCDelegate.sliderQuestionCountValue

            // Mark the appDelegate database as current so we don't update it again later.
            AppdelegateRef.appDelegate.MathFactsIsCurrent = 1
            
            if mathsFactsVCDelegate.spinningIconUp == false
            {
                mathsFactsVCDelegate.flashIcon()/// to flash up the new math operator sign briefly
            }

            // CR 11/27/2011 - Pop up instruction on first running of app
     
        }
      let defaults:UserDefaults = UserDefaults.standard
      
      if defaults.object(forKey: "firstRun") == nil
      {
        defaults.set(NSDate(), forKey: "firstRun")
        displayCouchMarks()
      } else {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)
      }
      defaults.synchronize()
        if(AppdelegateRef.appDelegate.islaunch == true)
        {
            if(mathsFactsVCDelegate.couchmarkView.isHidden == true)
            {
            self.setAnimationImages()
            }
        }
        // Start elapsed timer so we can score performance
        mathsFactsVCDelegate.elapsedTime = Timer.scheduledTimer(timeInterval: 1.0, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.secondsCounter), userInfo: nil, repeats: true)
        
        // Get the first set of facts
        mathsFactsVCDelegate.GenNextFact()
        
        // Set up images to flash math signs after swiping
        let xVal = (DeviceModel.SCREEN_WIDTH-150)/2
        let yVal = 92.5 //30
        mathsFactsVCDelegate.iconPlusSignLarge =            UIImageView.init(image:#imageLiteral(resourceName: "Plus205x205dot"))
        let LPlusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        mathsFactsVCDelegate.iconPlusSignLarge.frame = LPlusRect
        mathsFactsVCDelegate.view.addSubview(mathsFactsVCDelegate.iconPlusSignLarge)
        mathsFactsVCDelegate.iconPlusSignLarge.isHidden = false
        mathsFactsVCDelegate.iconPlusSignLarge.alpha = 0.0
        
        
        mathsFactsVCDelegate.iconMinusSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Minus205x205dot"))
        let LMinusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        mathsFactsVCDelegate.iconMinusSignLarge.frame = LMinusRect
        mathsFactsVCDelegate.view.addSubview(mathsFactsVCDelegate.iconMinusSignLarge)
        mathsFactsVCDelegate.iconMinusSignLarge.isHidden = false
        mathsFactsVCDelegate.iconMinusSignLarge.alpha = 0.0
        
        
        mathsFactsVCDelegate.iconTimesSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Times205x205dot"))
        let LTimesRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        mathsFactsVCDelegate.iconTimesSignLarge.frame = LTimesRect
        mathsFactsVCDelegate.view.addSubview(mathsFactsVCDelegate.iconTimesSignLarge)
        mathsFactsVCDelegate.iconTimesSignLarge.isHidden = false
        mathsFactsVCDelegate.iconTimesSignLarge.alpha = 0.0
        
        mathsFactsVCDelegate.iconDivideSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Divide205x205dot"))
        
        let LDivRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        mathsFactsVCDelegate.iconDivideSignLarge.frame = LDivRect
        mathsFactsVCDelegate.view.addSubview(mathsFactsVCDelegate.iconDivideSignLarge)
        mathsFactsVCDelegate.iconDivideSignLarge.isHidden = false
        mathsFactsVCDelegate.iconDivideSignLarge.alpha = 0.0
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)

    }
    // Custom method to load the swipe gestures which are used to allow the user to swipe in all directions.
    func callGestures()
    {
        // Swipe Left
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.handleSwipeLeft))
        swipeLeft.direction = .left
        mathsFactsVCDelegate.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.handleSwipeRight))
        swipeRight.direction = .right
        mathsFactsVCDelegate.view.addGestureRecognizer(swipeRight)

        // Swipe up
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.handleSwipeUp))
        swipeUp.direction = .up
        mathsFactsVCDelegate.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.handleSwipeDown))
        swipeDown.direction = .down
         mathsFactsVCDelegate.view.addGestureRecognizer(swipeDown)
        
        //TapGesture for PopView
        let popViewtapgeasture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.alertCloseBtnAction))
        popViewtapgeasture.numberOfTapsRequired = 1;
        mathsFactsVCDelegate.popOverView .addGestureRecognizer(popViewtapgeasture)
       
    }
    // Custom method to load the circle rotation animation for the arrow directions along with the math operators when the app launched.
    func setAnimationImages()
    {
       //Addding TapGesture to the view to redirect to mathfacts screen when tap on out of the animationView
        let tapgeasture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.tapRecognise))
        tapgeasture.numberOfTapsRequired = 1;
        
        mathsFactsVCDelegate.iconView.addGestureRecognizer(tapgeasture)
        mathsFactsVCDelegate.animationSmallView.addGestureRecognizer(tapgeasture)
        mathsFactsVCDelegate.iconView.addGestureRecognizer(tapgeasture)
        mathsFactsVCDelegate.backgroundImage.addGestureRecognizer(tapgeasture)
        mathsFactsVCDelegate.backgroundImage.isHidden = false
        mathsFactsVCDelegate.iconTimer.invalidate()
 
        // stop timer as this may be a second time through this code.
//        if !mathsFactsVCDelegate.iconTimer.isValid
//        {
//         //  mathsFactsVCDelegate.iconTimer = Timer.scheduledTimer(timeInterval: 0.005, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.iconTimerMethod), userInfo: nil, repeats: true)
//        }
    }
    
    // Custom method to present the flash images i.e operators sign large images when the user swipes upwards.
    func flashIcon()
    {
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.ffftsoundFileObject)
        
        switch (mathsFactsVCDelegate.selectedSegmentBasics) {  // Selective call the method to flash up the current Operator
        case 0: mathsFactsVCDelegate.iconCurrentSignLarge = mathsFactsVCDelegate.iconPlusSignLarge
            break
        case 1: mathsFactsVCDelegate.iconCurrentSignLarge = mathsFactsVCDelegate.iconMinusSignLarge
            break
        case 2: mathsFactsVCDelegate.iconCurrentSignLarge = mathsFactsVCDelegate.iconTimesSignLarge
            break
        case 3: mathsFactsVCDelegate.iconCurrentSignLarge = mathsFactsVCDelegate.iconDivideSignLarge
            break
        default: break
        }
        UIView.beginAnimations("fade in image", context: nil)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationCurve(.easeIn)
        mathsFactsVCDelegate.iconCurrentSignLarge.alpha = 1.0
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(fadeInAnimationFinished(animationID:finished:context:)))
        UIView.commitAnimations()
    }
    
   // Custom method to start the fade out animation to dismiss the selected flash image
    @objc func fadeInAnimationFinished(animationID:String,finished:NSNumber,context:UnsafeMutableRawPointer)
    {
        UIView.beginAnimations("fade out image", context: nil)
        UIView.setAnimationDelay(0.5)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationCurve(.easeInOut)
        // On occasion an icon would not get Faded out and would stay up until it specifically was rendered again and faded out.
        // So, now fade all icons (not just the current one) to catch any that might have been left behind
        //// iconCurrentSignLarge.alphac
        mathsFactsVCDelegate.iconPlusSignLarge.alpha = 0.0
        mathsFactsVCDelegate.iconMinusSignLarge.alpha = 0.0
        mathsFactsVCDelegate.iconTimesSignLarge.alpha = 0.0
        mathsFactsVCDelegate.iconDivideSignLarge.alpha = 0.0
        UIView.commitAnimations()
    }
    
    // Custom method to add the timer to change the operator button positions and the arrow image directions in the circle rotation animation.
    func iconTimerMethod(timer:Timer)
    {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
      statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)

        mathsFactsVCDelegate.angle -= 0.01
        if (mathsFactsVCDelegate.angle < -6.283) {
            mathsFactsVCDelegate.angle = 0
            }
        let transform:CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(mathsFactsVCDelegate.angle))
        
        mathsFactsVCDelegate.iconCircleImage.transform = transform
    }
    // Custom method to get the random numbers by using the level which was user selected.
    func GenNextFact()
    {  //Method to get new numbers
        
        //    int randomNum = 1
        var tempNum:Int = 1
        var indexToRndArray:Int = 1
        print(indexToRndArray)
        mathsFactsVCDelegate.spaceStr = "  "
        mathsFactsVCDelegate.firstRandomNum = 1
        mathsFactsVCDelegate.secondRandomNum = 1
        mathsFactsVCDelegate.elapsedSeconds = 0     // Reset elapsed timer
        mathsFactsVCDelegate.ErrorOnThisQuestion = false
        //Increment counter of the number of questions since last Positive Reinforcement
       // ajay commented
       // mathsFactsVCDelegate.questionCount = mathsFactsVCDelegate.questionCount+1
        //Take down Positive reinforcement message
        mathsFactsVCDelegate.PositiveReinforcementLbl.isHidden = true
        mathsFactsVCDelegate.animationView.isHidden = true
        switch (mathsFactsVCDelegate.selectedLevel)
        { //MathFacts Level
        case 0: //Level 1
            switch (mathsFactsVCDelegate.selectedSegmentBasics)
            {  // Math Opperation
            case 0,1: // Addition,Subtraction
                repeat {
                    indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
                    mathsFactsVCDelegate.secondRandomNum = AppdelegateRef.appDelegate.RandomNumSecondVal
                    mathsFactsVCDelegate.firstRandomNum = AppdelegateRef.appDelegate.RandomNumFirstVal
                    
                } while ((mathsFactsVCDelegate.firstRandomNum + mathsFactsVCDelegate.secondRandomNum) > 9)
                break
                
            case 2,3: // Multiplication ,Division
                repeat {
                    indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
                    mathsFactsVCDelegate.secondRandomNum = AppdelegateRef.appDelegate.RandomNumSecondVal
                    mathsFactsVCDelegate.firstRandomNum = AppdelegateRef.appDelegate.RandomNumFirstVal
                }
                    while ((mathsFactsVCDelegate.firstRandomNum * mathsFactsVCDelegate.secondRandomNum) > 9)
                break
                
            default:
                break
            }
            break
            
            // case 1: break //Level 2 - Allows for carry on Mult and Add
        // case 2: break //Level 3 - Allows for carry on Multiplication and Add
        case 1,2,3: //Level 4 - Allows for carry on Multiplication and Addition
            indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
            mathsFactsVCDelegate.secondRandomNum = AppdelegateRef.appDelegate.RandomNumSecondVal
            mathsFactsVCDelegate.firstRandomNum = AppdelegateRef.appDelegate.RandomNumFirstVal
            break
            
        default:// (selectedSegment) MathFacts Level
            break
        }
        // Randomly assign the 'target' digit to the first or second position in the equation
        if (arc4random_uniform(2) == 0)
        {
            tempNum = mathsFactsVCDelegate.firstRandomNum
            mathsFactsVCDelegate.firstRandomNum = mathsFactsVCDelegate.secondRandomNum
            mathsFactsVCDelegate.secondRandomNum = tempNum
        }
        // Set unique attributes based on math opperator/function to be performd
        switch (mathsFactsVCDelegate.selectedSegmentBasics)
        { // based on Math Opperation
        case 0: // Addition
            mathsFactsVCDelegate.mathOppStr = "+"
            mathsFactsVCDelegate.calculatedAnswer = mathsFactsVCDelegate.firstRandomNum + mathsFactsVCDelegate.secondRandomNum
            break
            
        case 1: // Subtraction (Transition to)
            mathsFactsVCDelegate.mathOppStr = "+"
            mathsFactsVCDelegate.transMathOppStr = "- "
            mathsFactsVCDelegate.calcResult = mathsFactsVCDelegate.firstRandomNum + mathsFactsVCDelegate.secondRandomNum
            break
            
        case 2: //Multiplication
            mathsFactsVCDelegate.mathOppStr = "×"
            mathsFactsVCDelegate.calculatedAnswer = mathsFactsVCDelegate.firstRandomNum * mathsFactsVCDelegate.secondRandomNum
            break
            
        case 3: // Division
            mathsFactsVCDelegate.mathOppStr = "×"
            mathsFactsVCDelegate.transMathOppStr = "÷"
            mathsFactsVCDelegate.calcResult = mathsFactsVCDelegate.firstRandomNum * mathsFactsVCDelegate.secondRandomNum
            break
            
        default:
            break
        }
        
        // Set common attributes for Add Mult  and Div Sub
        switch (mathsFactsVCDelegate.selectedSegmentBasics)
        { // based on Math Opperation
        case 0,2: // Addition// Multiplication
            // Reveal all Addition and Multiplication fields
            mathsFactsVCDelegate.mathOperatorSign2Lbl.isHidden = false
            mathsFactsVCDelegate.mathOperatorSign1Lbl.isHidden = false
            mathsFactsVCDelegate.randomNumber1Lbl.isHidden = false
            mathsFactsVCDelegate.randomNumber2Lbl.isHidden = false
            mathsFactsVCDelegate.mathFactsAnswer1Lbl.isHidden = false
            mathsFactsVCDelegate.mathFactsAnswer2Lbl.isHidden = false
            mathsFactsVCDelegate.input1Lbl.isHidden = false
            mathsFactsVCDelegate.input2Lbl.isHidden = false
            mathsFactsVCDelegate.inputAnswer1Lbl.isHidden = false
            mathsFactsVCDelegate.inputAnswer2Lbl.isHidden = false
            mathsFactsVCDelegate.downLeftArrow.isHidden = false
            mathsFactsVCDelegate.downRightArrow.isHidden = false
            mathsFactsVCDelegate.Equals1Lbl.isHidden = false
            mathsFactsVCDelegate.Equals2Lbl.isHidden = false
 
            // Hide all Transition to Subtraction and Division fields
            
            mathsFactsVCDelegate.referenceEqnLbl.isHidden = true
            mathsFactsVCDelegate.mathFactsAnswer3Lbl.isHidden = true
            mathsFactsVCDelegate.mathFactsAnswer4Lbl.isHidden = true
            
            mathsFactsVCDelegate.mathoperator1Lbl.isHidden = true
            mathsFactsVCDelegate.mathoperator2Lbl.isHidden = true
            mathsFactsVCDelegate.mathoperator3Lbl.isHidden = true
            mathsFactsVCDelegate.mathoperator4Lbl.isHidden = true

            mathsFactsVCDelegate.SDInput1Lbl.isHidden = true
            mathsFactsVCDelegate.SDInput2Lbl.isHidden = true
            mathsFactsVCDelegate.SDInput3Lbl.isHidden = true
            mathsFactsVCDelegate.SDInput4Lbl.isHidden = true
            mathsFactsVCDelegate.forkedArrowView.isHidden = true
            
            
            mathsFactsVCDelegate.mathOperatorSign2Lbl.text = mathsFactsVCDelegate.mathOppStr
            mathsFactsVCDelegate.mathOperatorSign1Lbl.text = mathsFactsVCDelegate.mathOppStr
            mathsFactsVCDelegate.randomNumber1Lbl.text = String(mathsFactsVCDelegate.firstRandomNum)
            mathsFactsVCDelegate.randomNumber2Lbl.text = String(mathsFactsVCDelegate.secondRandomNum)
            mathsFactsVCDelegate.mathFactsAnswer1Lbl.text = String() // Blank out Fact results
            mathsFactsVCDelegate.mathFactsAnswer2Lbl.text = String() // Blank out Fact results
            
            mathsFactsVCDelegate.answerVar = 0
            
            mathsFactsVCDelegate.input1Lbl.text = ""
            mathsFactsVCDelegate.input2Lbl.text = ""
            mathsFactsVCDelegate.inputAnswer1Lbl.text = ""
            mathsFactsVCDelegate.inputAnswer2Lbl.text = ""
            
            if ((mathsFactsVCDelegate.calculatedAnswer) > 9)
            {
            mathsFactsVCDelegate.inputAnswer2Lbl.backgroundColor = UIColor.clear
                mathsFactsVCDelegate.inputAnswer2Lbl.isHidden = false

                
             } else {
                mathsFactsVCDelegate.inputAnswer2Lbl.backgroundColor = UIColor.clear
                mathsFactsVCDelegate.inputAnswer2Lbl.isHidden = true

                
            }
            // CR 11/26/2011 Add color coded input boxes
            
            mathsFactsVCDelegate.downLeftArrow.isHidden = true
            mathsFactsVCDelegate.downRightArrow.isHidden = true
            
            mathsFactsVCDelegate.inputPhase = 0
            break
            
        // case 1: break // Subtraction
        case 1,3: // Division
            // Hide all Addition and Multiplication fields
            mathsFactsVCDelegate.mathOperatorSign2Lbl.isHidden = true
            mathsFactsVCDelegate.mathOperatorSign1Lbl.isHidden = true
            mathsFactsVCDelegate.randomNumber1Lbl.isHidden = true
            mathsFactsVCDelegate.randomNumber2Lbl.isHidden = true
            mathsFactsVCDelegate.mathFactsAnswer1Lbl.isHidden = true
            mathsFactsVCDelegate.mathFactsAnswer2Lbl.isHidden = true
            mathsFactsVCDelegate.input1Lbl.isHidden = true
            mathsFactsVCDelegate.input2Lbl.isHidden = true
            mathsFactsVCDelegate.inputAnswer1Lbl.isHidden = true
            mathsFactsVCDelegate.inputAnswer2Lbl.isHidden = true
            mathsFactsVCDelegate.downLeftArrow.isHidden = true
            mathsFactsVCDelegate.downRightArrow.isHidden = true
            mathsFactsVCDelegate.Equals1Lbl.isHidden = true
            mathsFactsVCDelegate.Equals2Lbl.isHidden = true
            // Reveal all Transition to Subtraction and Division fields
            mathsFactsVCDelegate.referenceEqnLbl.isHidden = false
            mathsFactsVCDelegate.mathFactsAnswer3Lbl.isHidden = false
            mathsFactsVCDelegate.mathFactsAnswer4Lbl.isHidden = false
            mathsFactsVCDelegate.mathoperator1Lbl.isHidden = false
            mathsFactsVCDelegate.mathoperator2Lbl.isHidden = false
            mathsFactsVCDelegate.mathoperator3Lbl.isHidden = false
            mathsFactsVCDelegate.mathoperator4Lbl.isHidden = false
            mathsFactsVCDelegate.SDInput1Lbl.isHidden = false
            mathsFactsVCDelegate.SDInput2Lbl.isHidden = false
            mathsFactsVCDelegate.SDInput3Lbl.isHidden = false
            mathsFactsVCDelegate.SDInput4Lbl.isHidden = false
            mathsFactsVCDelegate.forkedArrowView.isHidden = false
            
            mathsFactsVCDelegate.referenceEqnLbl.text = String(mathsFactsVCDelegate.firstRandomNum)+mathsFactsVCDelegate.mathOppStr+String(mathsFactsVCDelegate.secondRandomNum)+" = "+String(mathsFactsVCDelegate.calcResult)
            mathsFactsVCDelegate.mathFactsAnswer3Lbl.text = mathsFactsVCDelegate.spaceStr
   
            mathsFactsVCDelegate.mathoperator1Lbl.text = mathsFactsVCDelegate.transMathOppStr
            mathsFactsVCDelegate.SDInput1Lbl.text = ""
            mathsFactsVCDelegate.mathoperator2Lbl.text = "="
            mathsFactsVCDelegate.SDInput2Lbl.text = ""
            
            mathsFactsVCDelegate.mathFactsAnswer4Lbl.text = mathsFactsVCDelegate.spaceStr
            
            mathsFactsVCDelegate.mathoperator3Lbl.text = mathsFactsVCDelegate.transMathOppStr
            mathsFactsVCDelegate.SDInput3Lbl.text = ""
            mathsFactsVCDelegate.mathoperator4Lbl.text = "="
            mathsFactsVCDelegate.SDInput4Lbl.text = ""

            
           mathsFactsVCDelegate.inputPhase = 1
            break

        default:
            break
        }
  
        if(mathsFactsVCDelegate.selectedSegmentBasics == 0 || mathsFactsVCDelegate.selectedSegmentBasics == 2)
        {
            mathsFactsVCDelegate.AMView.backgroundColor = UIColor.clear
          mathsFactsVCDelegate.AMView.isHidden = false

         } else {
            mathsFactsVCDelegate.AMView.backgroundColor = UIColor.clear
          mathsFactsVCDelegate.AMView.isHidden = true
          

        }
    }
    // Custom method to show the arrows when the user misplaced the value in its correct position while performing the arithmetic operaions.

    func callDisplayImages()
    {
        //  Arrow images
        mathsFactsVCDelegate.downLeftArrow = UIImageView(image:#imageLiteral(resourceName: "DownLeft Arrow"))
        mathsFactsVCDelegate.downLeftArrow.frame = CGRect(x: CGFloat(8), y: CGFloat(8), width: CGFloat(23), height: CGFloat(23))
        mathsFactsVCDelegate.arrowsView.addSubview(mathsFactsVCDelegate.downLeftArrow)
        mathsFactsVCDelegate.downLeftArrow.isHidden = true
        mathsFactsVCDelegate.downRightArrow = UIImageView(image:#imageLiteral(resourceName: "DownRight Arrow"))
        mathsFactsVCDelegate.downRightArrow.frame = CGRect(x: CGFloat(8), y: CGFloat(8), width: CGFloat(23), height: CGFloat(23))
        mathsFactsVCDelegate.arrowsView.addSubview(mathsFactsVCDelegate.downRightArrow)
        mathsFactsVCDelegate.downRightArrow.isHidden = true
        mathsFactsVCDelegate.forkedArrowView.isHidden = true
    }
    // Custom method to remove some views from the super view when the other views are peresented.
    func endAnimations()
    {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
      statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)
        //Remove the icon view from the superview
        
        if (mathsFactsVCDelegate.iconView != nil)
        {
            mathsFactsVCDelegate.iconView.isHidden = true
            //mathsFactsVCDelegate.iconView.removeFromSuperview()
        }
        
        if (mathsFactsVCDelegate.iconTimer.isValid)
        {
            mathsFactsVCDelegate.iconTimer.invalidate()
        }
        
        mathsFactsVCDelegate.spinningIconUp = false;
    }
    //Updating the frames for the iPhone 4 device
    func viewWillLayoutSubviews()
    {
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
            //Adjusting Number Views frames for iPhone 4s device
            
            mathsFactsVCDelegate.firstView.frame = CGRect(x: mathsFactsVCDelegate.firstView.frame.origin.x, y: mathsFactsVCDelegate.firstView.frame.origin.y, width: mathsFactsVCDelegate.firstView.frame.size.width, height:69)
            mathsFactsVCDelegate.secondView.frame = CGRect(x: mathsFactsVCDelegate.secondView.frame.origin.x, y: mathsFactsVCDelegate.secondView.frame.origin.y, width: mathsFactsVCDelegate.secondView.frame.size.width, height:69)
            mathsFactsVCDelegate.thirdView.frame = CGRect(x: mathsFactsVCDelegate.thirdView.frame.origin.x, y: mathsFactsVCDelegate.thirdView.frame.origin.y, width: mathsFactsVCDelegate.thirdView.frame.size.width, height:69)
            mathsFactsVCDelegate.fourthView.frame = CGRect(x: mathsFactsVCDelegate.fourthView.frame.origin.x, y: mathsFactsVCDelegate.fourthView.frame.origin.y, width: mathsFactsVCDelegate.fourthView.frame.size.width, height:69)
            
            //Adjusting animationView frames for iPhone 4s device

            mathsFactsVCDelegate.animationSmallView.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH-mathsFactsVCDelegate.animationSmallView.frame.size.height+4)/2, y: mathsFactsVCDelegate.animationSmallView.frame.origin.y, width: mathsFactsVCDelegate.animationSmallView.frame.size.height+4, height:mathsFactsVCDelegate.animationSmallView.frame.size.height)
            
           // popOverView frames for iPhone 4s device
             mathsFactsVCDelegate.popOverView.frame = CGRect(x: mathsFactsVCDelegate.popOverView.frame.origin.x, y: 0, width: mathsFactsVCDelegate.popOverView.frame.size.width, height: mathsFactsVCDelegate.popOverView.frame.size.height+20)
        
            mathsFactsVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            mathsFactsVCDelegate.popOverView .bringSubview(toFront: mathsFactsVCDelegate.popUpTitleView)
            mathsFactsVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 350)
            mathsFactsVCDelegate.animationSmallView.frame.size = CGSize(width: 165, height: 162)
            
        } else if DeviceModel.IS_IPHONE_5 {
           mathsFactsVCDelegate.animationSmallView.frame.size = CGSize(width: 165, height: 162)
        } else if DeviceModel.IS_IPHONE_6
        {
        mathsFactsVCDelegate.animationSmallView.frame.size = CGSize(width: 194, height: 190)
            
        } else if DeviceModel.IS_IPHONE_6P
        {
             mathsFactsVCDelegate.animationSmallView.frame.size = CGSize(width: 215, height: 210)
        }
    }

    //MARK:- Custom Button actions
    
    // Custom method to present the alert with the information about that screen.
    func showMathFactsGeneralInfo()
    {
        mathsFactsVCDelegate.popOverView.isHidden = false
        mathsFactsVCDelegate.view.bringSubview(toFront: mathsFactsVCDelegate.popOverView)
          }
    
    // Custom method to show the `menuViewController`.
    
    func buttonMenuView(){
        
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMenuVC) as! MenuViewController
        
        mathsFactsVCDelegate.present(nextVC, animated: true, completion: nil)
    }
    // Custom method to identify that which math operator has touched.
    func touchesBegan(touches:NSSet,event:UIEvent)
    {
        var touchedOpperator:Int = 0;
        
        // We dont want to process touches unless the spinning icon is visible
        if (mathsFactsVCDelegate.spinningIconUp == false)
        {
            return
        }
        let touch: UITouch = touches.anyObject() as! UITouch
        
        // gets the coordinats of the touch with respect to the specified view.
        let pt:CGPoint = touch.location(in:mathsFactsVCDelegate.iconView)
        
        // If touch was on an operator (icon images are 40x40 pixels.  touch must be within the range to count.  Range is currently set to the same size as the images 40x40)
        if (((pt.x > CGFloat(mathsFactsVCDelegate.plusX)) && (pt.x < CGFloat(mathsFactsVCDelegate.plusX) + 40))  &&  ((pt.y > CGFloat(mathsFactsVCDelegate.plusY)) && (pt.y < CGFloat(mathsFactsVCDelegate.plusY) + 40))) {
            touchedOpperator = 0;
        } else if (((pt.x > CGFloat(mathsFactsVCDelegate.minusX)) && (pt.x < CGFloat(mathsFactsVCDelegate.minusX) + 40))  &&  ((pt.y > CGFloat(mathsFactsVCDelegate.minusY)) && (pt.y < CGFloat(mathsFactsVCDelegate.minusY) + 40))) {
            touchedOpperator = 1;
        } else if (((pt.x > CGFloat(mathsFactsVCDelegate.timesX)) && (pt.x < CGFloat(mathsFactsVCDelegate.timesX) + 40))  &&  ((pt.y > CGFloat(mathsFactsVCDelegate.timesY)) && (pt.y < CGFloat(mathsFactsVCDelegate.timesY) + 40))) {
            touchedOpperator = 2;
        } else if (((pt.x > CGFloat(mathsFactsVCDelegate.divideX)) && (pt.x < CGFloat(mathsFactsVCDelegate.divideX) + 40))  &&  ((pt.y > CGFloat(mathsFactsVCDelegate.divideY)) && (pt.y < CGFloat(mathsFactsVCDelegate.divideY) + 40))) {
            touchedOpperator = 3;
        } else if (((pt.x > 110) && (pt.x < 210))  &&  ((pt.y > 225) && (pt.y < 325))) {
         return;
        }
        
        // If we get to here the touch was on a math opperator icon
        // Let's ding to signal succecss (since we were quacking for misses)
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject);
        
        // Cancel animation timer and remove images on any touch
        endAnimations()
        
        // Update the AppDelegate's attribute if the operator was changed from previous value
        if (touchedOpperator != mathsFactsVCDelegate.selectedSegmentBasics) {
            mathsFactsVCDelegate.selectedSegmentBasics = touchedOpperator;
            
            //Define appDelegate objext so we can access common variables
            AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: touchedOpperator)
        }
        // Flash up the new math operator sign briefly
        mathsFactsVCDelegate.flashIcon()
        //  Start timer to get new numbers
        mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
    }
    
    
    // Custom method to do the functionality of the arithmetic operation according to the button was selected in the number pad. If user selects the correct answer it will go to the next step of arithmetic operation otherwise gives a error sound.
    func buttonDigitPressed(sender: UIButton)
    {
        switch (mathsFactsVCDelegate.selectedSegmentBasics)
        { // Math Opperation
            
        case 0,2: // 0:Addition // 2:Multiplication
            switch (mathsFactsVCDelegate.inputPhase)
            {
            case 0:
                if (mathsFactsVCDelegate.secondRandomNum == sender.tag)
                {
                    mathsFactsVCDelegate.input1Lbl.text = String(mathsFactsVCDelegate.secondRandomNum)
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                    mathsFactsVCDelegate.downLeftArrow.isHidden = true
                    mathsFactsVCDelegate.inputPhase = mathsFactsVCDelegate.inputPhase+1
                 } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                    mathsFactsVCDelegate.downLeftArrow.isHidden = false
                }
                break
                
            case 1:
                if (mathsFactsVCDelegate.firstRandomNum == sender.tag)
                {
                    mathsFactsVCDelegate.input2Lbl.text = String(mathsFactsVCDelegate.firstRandomNum)
             
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                    mathsFactsVCDelegate.downRightArrow.isHidden = true
                    if (mathsFactsVCDelegate.calculatedAnswer < 10)
                    {
                        mathsFactsVCDelegate.inputPhase = 5
                     } else {
                      mathsFactsVCDelegate.inputPhase = 6
                    }
                } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                    mathsFactsVCDelegate.downRightArrow.isHidden = false
                }
                break
                
            case 5: // Answer is ONE digit and this is it
                if (sender.tag == mathsFactsVCDelegate.calculatedAnswer)
                {
                    mathsFactsVCDelegate.inputAnswer1Lbl.text = String(mathsFactsVCDelegate.calculatedAnswer)
                    mathsFactsVCDelegate.mathFactsAnswer1Lbl.text = String(mathsFactsVCDelegate.calculatedAnswer)  // Show ans in Fact results
                    mathsFactsVCDelegate.getNewFact = Int(true)
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                    mathsFactsVCDelegate.inputPhase = 4
                } else {
                    mathsFactsVCDelegate.responseError = true
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)  // Quack
                }
                break
            case 6: // Answer is TWO digits and this is the FIRST digit
                mathsFactsVCDelegate.answerVar = sender.tag
                if (mathsFactsVCDelegate.answerVar == mathsFactsVCDelegate.calculatedAnswer / 10)
                {
                    mathsFactsVCDelegate.inputAnswer1Lbl.text = String(mathsFactsVCDelegate.answerVar)
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                    mathsFactsVCDelegate.inputPhase = 7
                } else {
                    mathsFactsVCDelegate.responseError = true
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)  // Quack
                }
                break
            case 7: // Answer is TWO digits and this is the SECOND digit
                mathsFactsVCDelegate.answerVar = sender.tag
                if (mathsFactsVCDelegate.answerVar == mathsFactsVCDelegate.calculatedAnswer % 10) {
                    mathsFactsVCDelegate.inputAnswer2Lbl.text = String(mathsFactsVCDelegate.answerVar)
                    mathsFactsVCDelegate.mathFactsAnswer1Lbl.text = String(mathsFactsVCDelegate.calculatedAnswer / 10)  // Show ans in Fact results
                    mathsFactsVCDelegate.mathFactsAnswer2Lbl.text = String(mathsFactsVCDelegate.answerVar)  // Show ans in Fact results
                    mathsFactsVCDelegate.getNewFact = Int(true)
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                    mathsFactsVCDelegate.inputPhase = 9999 // Shouldn't ever happen!
                } else {
                    mathsFactsVCDelegate.responseError = true
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)  // Quack
                }
                break
                
            default:
                break
            }
            break
            
        // case 1: break // Subtraction
        case 1,3: // Division
            mathsFactsVCDelegate.spaceStr = "  "
            switch (mathsFactsVCDelegate.inputPhase)
            {
            case 1:
                if (mathsFactsVCDelegate.calcResult >= 10)
                {
                    if (sender.tag == mathsFactsVCDelegate.calcResult / 10)
                    {
                        mathsFactsVCDelegate.mathFactsAnswer3Lbl.text = String(mathsFactsVCDelegate.calcResult / 10)
                        break
                    } else {
                        mathsFactsVCDelegate.responseError = true
                    }
                    break
                 } else {
                    mathsFactsVCDelegate.inputPhase = mathsFactsVCDelegate.inputPhase+1 // Advances inputPhase since we are 'skipping' ahead
                }
                fallthrough
            case 2:
                
                if (sender.tag == mathsFactsVCDelegate.calcResult % 10)
                {
                    mathsFactsVCDelegate.mathFactsAnswer3Lbl.text = String(mathsFactsVCDelegate.calcResult)
                 } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
            case 3: // either order for the two equations is valid, but need to remember users choice
                if ((sender.tag == mathsFactsVCDelegate.firstRandomNum) || (sender.tag == mathsFactsVCDelegate.secondRandomNum))
                {
                    if (sender.tag == mathsFactsVCDelegate.firstRandomNum)
                    {
                        mathsFactsVCDelegate.firstResponse = mathsFactsVCDelegate.firstRandomNum
                        mathsFactsVCDelegate.secondResponse = mathsFactsVCDelegate.secondRandomNum
                     } else {
                        mathsFactsVCDelegate.firstResponse = mathsFactsVCDelegate.secondRandomNum
                        mathsFactsVCDelegate.secondResponse = mathsFactsVCDelegate.firstRandomNum
                    }
                    
                    mathsFactsVCDelegate.mathoperator1Lbl.text = mathsFactsVCDelegate.transMathOppStr
                    mathsFactsVCDelegate.SDInput1Lbl.text = String(mathsFactsVCDelegate.firstResponse)
                    mathsFactsVCDelegate.mathoperator2Lbl.text = "="
                    mathsFactsVCDelegate.SDInput2Lbl.text = ""
                    
                 } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
                
            case 4:
                if (sender.tag ==  mathsFactsVCDelegate.secondResponse)
                {
                    mathsFactsVCDelegate.mathoperator1Lbl.text = mathsFactsVCDelegate.transMathOppStr
                    mathsFactsVCDelegate.SDInput1Lbl.text = String(mathsFactsVCDelegate.firstResponse)
                    mathsFactsVCDelegate.mathoperator2Lbl.text = "="
                    mathsFactsVCDelegate.SDInput2Lbl.text = String(mathsFactsVCDelegate.secondResponse)
                    
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject) // Ding  (this equation is finished)
                } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
                
                
            case 5:
                if (mathsFactsVCDelegate.calcResult >= 10) {
                    if (sender.tag == mathsFactsVCDelegate.calcResult / 10) {
                        mathsFactsVCDelegate.mathFactsAnswer4Lbl.text = String(mathsFactsVCDelegate.calcResult / 10)
                        break
                     } else {
                        mathsFactsVCDelegate.responseError = true
                    }
                    break
                 } else {
                    mathsFactsVCDelegate.inputPhase = mathsFactsVCDelegate.inputPhase+1
                    
                } // Advances inputPhase since we are 'skipping' ahead
                fallthrough
            case 6:
                if (sender.tag == mathsFactsVCDelegate.calcResult % 10)
                {
                    mathsFactsVCDelegate.mathFactsAnswer4Lbl.text = String(mathsFactsVCDelegate.calcResult)
                } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
                
            case 7:
                if (sender.tag == mathsFactsVCDelegate.secondResponse)
                {
                    
                    mathsFactsVCDelegate.mathoperator3Lbl.text = mathsFactsVCDelegate.transMathOppStr
                    mathsFactsVCDelegate.SDInput3Lbl.text = String(mathsFactsVCDelegate.secondResponse)
                    mathsFactsVCDelegate.mathoperator4Lbl.text = "="
                    mathsFactsVCDelegate.SDInput4Lbl.text = ""
                    
                    
                 } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
                
                
            case 8:
                if (sender.tag == mathsFactsVCDelegate.firstResponse)
                {
                    mathsFactsVCDelegate.mathoperator3Lbl.text = mathsFactsVCDelegate.transMathOppStr
                    mathsFactsVCDelegate.SDInput3Lbl.text = String(mathsFactsVCDelegate.secondResponse)
                    mathsFactsVCDelegate.mathoperator4Lbl.text = "="
                    mathsFactsVCDelegate.SDInput4Lbl.text = String(mathsFactsVCDelegate.firstResponse)
                    
                    mathsFactsVCDelegate.getNewFact = Int(true)
                 } else {
                    mathsFactsVCDelegate.responseError = true
                }
                break
                
            default:
                break
            }
            if (mathsFactsVCDelegate.responseError) {
                mathsFactsVCDelegate.ErrorOnThisQuestion = true   // Set flag for the entire question
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject) //Quack
            } else if (mathsFactsVCDelegate.getNewFact == Int(true)) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject) // Ding sound
            } else {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // key click
                mathsFactsVCDelegate.inputPhase = mathsFactsVCDelegate.inputPhase+1
            }
        break // div and sub
        default:
            break
        }
        
        // Flash up a positive reinforcement occasionally
        if (mathsFactsVCDelegate.ErrorOnThisQuestion == false && mathsFactsVCDelegate.getNewFact == Int(true) && (mathsFactsVCDelegate.questionCount > 4) )
        {
            var randomIndex:Int = Constant.PositiveSayings.count
            randomIndex = Int(arc4random_uniform(UInt32(randomIndex)))
            // tacky reuse of var as input param and result...
            
            let myString:String = Constant.PositiveSayings[randomIndex]
            mathsFactsVCDelegate.PositiveReinforcementLbl.text = myString
            switch(arc4random_uniform(7))
            {
            case 0:
                mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.red
                mathsFactsVCDelegate.PositiveReinforcementLbl.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6274509804, blue: 0.7921568627, alpha: 1)
                break
            case 1:
                mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.blue
                mathsFactsVCDelegate.PositiveReinforcementLbl.backgroundColor =  #colorLiteral(red: 0.1568627451, green: 0.6274509804, blue: 0.7921568627, alpha: 1)
                break
            case 2:
                mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.gray
                mathsFactsVCDelegate.PositiveReinforcementLbl.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6274509804, blue: 0.7921568627, alpha: 1)
                break
            case 3:mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.brown
                break
            case 4:mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.magenta
                break
            case 5:mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.orange
                break
            case 6:
                mathsFactsVCDelegate.PositiveReinforcementLbl.textColor = UIColor.purple
                mathsFactsVCDelegate.PositiveReinforcementLbl.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.6274509804, blue: 0.7921568627, alpha: 1)
                break

            default:
                break
            }
            //mathsFactsVCDelegate.PositiveReinforcementLbl.isHidden = false
            mathsFactsVCDelegate.animationView.isHidden = false
             //Here gif animation images are displaying according to the selecte4d index
            mathsFactsVCDelegate.animationImage.image = UIImage.gifImageWithData(mathsFactsVCDelegate.gifImagesArray[mathsFactsVCDelegate.selectedGifIndex])
                mathsFactsVCDelegate.forkedArrowView.isHidden = true  // otherwise it excludes the reinforcement banner - the next "new question" will restore it
            if mathsFactsVCDelegate.selectedGifIndex==2
            {
                mathsFactsVCDelegate.selectedGifIndex = 0
             } else {
                mathsFactsVCDelegate.selectedGifIndex = mathsFactsVCDelegate.selectedGifIndex+1
            }
            mathsFactsVCDelegate.questionCount = 0
        }
        //Define appDelegate object so we can access common variables
        //set the score
        if (mathsFactsVCDelegate.responseError) {
            AppdelegateRef.appDelegate.setScore(inScore: 2)  //Set score to 2 (Higher is worse, but for now we always set it to 2)
            mathsFactsVCDelegate.ErrorOnThisQuestion = true
            mathsFactsVCDelegate.responseError = false
        }
        if (mathsFactsVCDelegate.getNewFact == Int(true))
        {
            // Set the time it took to answer this question
            AppdelegateRef.appDelegate.setTime(inTime:mathsFactsVCDelegate.elapsedSeconds)
            mathsFactsVCDelegate.questionCount = mathsFactsVCDelegate.questionCount+1
            // Timer get reset to '0' in the GetNexFact method
            // Start timer for call back to get new numbers (allows user time to see thier results on screen)
           // mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 2.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
            let timeInterval:TimeInterval!
            if(mathsFactsVCDelegate.animationView.isHidden == true)
            {
                timeInterval = 2.5
             } else {
                timeInterval = 8.1

            }
            mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: timeInterval, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)

            
            mathsFactsVCDelegate.getNewFact = 0
            mathsFactsVCDelegate.inputPhase = 1000 // Catch in default
        }
    }
    // Custom method implemented for selecting the arithmetic opertors while circular animation
    
    func touchBtnAction(sender: UIButton)
    {
        var touchedOpperator:Int = 0;
        touchedOpperator = sender.tag
        
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject);
        endAnimations()
        if (touchedOpperator != mathsFactsVCDelegate.selectedSegmentBasics)
        {
            mathsFactsVCDelegate.selectedSegmentBasics = touchedOpperator;
            AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: touchedOpperator)
        }
        mathsFactsVCDelegate.flashIcon()
        mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
    }
    //Custom method used for displaying the next slides for while tapping or swiping
    func couchmarkButtonAction(sender: UIButton)
    {
        if(sender.tag == 1||sender.tag == 3)
        {
            mathsFactsVCDelegate.pageControl.currentPage = 1
            mathsFactsVCDelegate.couchmarkScrollView.contentOffset = CGPoint(x: DeviceModel.SCREEN_WIDTH, y: DeviceModel.SCREEN_HEIGHT)
        } else if(sender.tag == 2)
        {
            mathsFactsVCDelegate.pageControl.currentPage = 2
            mathsFactsVCDelegate.couchmarkScrollView.contentOffset = CGPoint(x: DeviceModel.SCREEN_WIDTH*2, y: DeviceModel.SCREEN_HEIGHT)
        }
        else if(sender.tag == 4)
        {
            mathsFactsVCDelegate.pageControl.currentPage = 3
            mathsFactsVCDelegate.couchmarkScrollView.contentOffset = CGPoint(x: DeviceModel.SCREEN_WIDTH*3, y: DeviceModel.SCREEN_HEIGHT)
        }
        else if(sender.tag == 5 || sender.tag == 6)
        {
            self.exitBtnAction(sender: sender)
        }
        
    }
    // Custom method to push to the `LongDivisionVC` if the segment value is 3 otherwise pust to the`MultiAppVC` when user swipes left side.
    func handleSwipeLeft(recognizer: UISwipeGestureRecognizer)
    {
        
        if (mathsFactsVCDelegate.selectedSegmentBasics == 3) {
            
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kLongDivisionVC) as! LongDivisionViewController
            
            nextVC.modalTransitionStyle = .flipHorizontal
            mathsFactsVCDelegate.present(nextVC, animated: true, completion: nil)
        } else {
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMultiAppVC) as! MultiAppViewController
            
            nextVC.modalTransitionStyle = .flipHorizontal
            mathsFactsVCDelegate.present(nextVC, animated: true, completion: nil)
        }
         AppdelegateRef.appDelegate.islaunch = false
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.wooshsoundFileObject);
        // Cancel timer
        mathsFactsVCDelegate.iconTimer.invalidate()
        endAnimations() //Cancel animation timer and remove images
    }
    
    // Custom method to push to the `MenuViewController` when user swipes right side.
    func handleSwipeRight(recognizer: UISwipeGestureRecognizer)
    {
        
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMenuVC) as! MenuViewController
        AppdelegateRef.appDelegate.islaunch = false
        nextVC.modalTransitionStyle = .flipHorizontal
        mathsFactsVCDelegate.present(nextVC, animated: true, completion: nil)
        
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        // Cancel timer
        mathsFactsVCDelegate.iconTimer.invalidate()
        endAnimations() //Cancel animation timer and remove images
    }
    //This function is called when home button is selected for displaying the Animation
    func homeButtonAction(sender: UIButton)
    {
        AppdelegateRef.appDelegate.islaunch = true
        mathsFactsVCDelegate.iconTimer.invalidate()
        mathsFactsVCDelegate.iconView.isHidden = false
      let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)
        setAnimationImages()
          }
    //Exit Button Action in couchmarks
    func exitBtnAction(sender: UIButton)
    {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
      
         mathsFactsVCDelegate.couchmarkView.isHidden = true
        self.setAnimationImages()
        mathsFactsVCDelegate.couchmarkView.removeFromSuperview()
        showMathFactsGeneralInfo()
    }
    // Custom method to get the new random numbers and changing the arithmetic operator when user swipes up side.
    func handleSwipeUp(recognizer: UISwipeGestureRecognizer)
    {
        endAnimations() //Cancel animation timer and remove images

        mathsFactsVCDelegate.selectedSegmentBasics = mathsFactsVCDelegate.selectedSegmentBasics+1;
        if mathsFactsVCDelegate.selectedSegmentBasics>3
        {
            mathsFactsVCDelegate.selectedSegmentBasics = 0;
        }
      
        self.flashIcon() /// to flash up the new math operator sign briefly
        //  Start timer to get new numbers
        mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: mathsFactsVCDelegate.selectedSegmentBasics)
    }
    
     // Custom method to get the new random numbers and changing the arithmetic operator when user swipes Down side.
    func handleSwipeDown(recognizer: UISwipeGestureRecognizer)
    {
        endAnimations() //Cancel animation timer and remove images

        mathsFactsVCDelegate.selectedSegmentBasics = mathsFactsVCDelegate.selectedSegmentBasics-1;
        if mathsFactsVCDelegate.selectedSegmentBasics < 0
        {
            mathsFactsVCDelegate.selectedSegmentBasics = 3;
        }
        
        self.flashIcon()/// to flash up the new math operator sign briefly
        mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
        //  Start timer to get new numbers
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: mathsFactsVCDelegate.selectedSegmentBasics)
    }
    func tapRecognise(recognizer:UITapGestureRecognizer)
    {
        let touchedOpperator:Int = 0;

            AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject);
        endAnimations()
        if (touchedOpperator != mathsFactsVCDelegate.selectedSegmentBasics)
        {
            mathsFactsVCDelegate.selectedSegmentBasics = touchedOpperator;
            AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: touchedOpperator)
        }
        mathsFactsVCDelegate.flashIcon()
        mathsFactsVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: mathsFactsVCDelegate, selector: #selector(mathsFactsVCDelegate.GenNextFact), userInfo: nil, repeats: false)
    }
    //Custom method is used to display the couchmarks for first time
    func displayCouchMarks()
    {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
        mathsFactsVCDelegate.couchmarkView.isHidden = false
        for view in mathsFactsVCDelegate.couchmarkScrollView.subviews{
            view.removeFromSuperview()
        }
       mathsFactsVCDelegate.couchmarkScrollView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: DeviceModel.SCREEN_HEIGHT)
      

        
        let exitButton1:UIButton = UIButton(type: .custom)
        exitButton1.frame = CGRect(x: 10, y: DeviceModel.SCREEN_HEIGHT-60, width: 60, height: 60)
        exitButton1.addTarget(mathsFactsVCDelegate, action:#selector(mathsFactsVCDelegate.exitBtnAction), for: .touchUpInside)
        
        let exitButton2:UIButton = UIButton(type: .custom)
        exitButton2.frame = CGRect(x: DeviceModel.SCREEN_WIDTH+10, y: DeviceModel.SCREEN_HEIGHT-60, width: 60, height: 60)
         exitButton2.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.exitBtnAction), for: .touchUpInside)

        let exitButton3:UIButton = UIButton(type: .custom)
        exitButton3.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH*2)+10, y: DeviceModel.SCREEN_HEIGHT-60, width: 60, height: 60)
         exitButton3.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.exitBtnAction), for: .touchUpInside)

        let exitButton4:UIButton = UIButton(type: .custom)
        exitButton4.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH*3)+10, y: DeviceModel.SCREEN_HEIGHT-60, width: 60, height: 60)
        exitButton4.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.exitBtnAction), for: .touchUpInside)
        
        let logoButton:UIButton = UIButton(type: .custom)
        logoButton.tag = 1
        logoButton.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH-200)/2, y: (DeviceModel.SCREEN_HEIGHT-300)/2, width: 200, height: 200)
        logoButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
        
        let homeButton:UIButton = UIButton(type: .custom)
        homeButton.tag = 2
        homeButton.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH+7), y: 17, width: 40, height: 85)
        homeButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
        
        let swipeUpButton:UIButton = UIButton(type: .custom)
        swipeUpButton.tag = 2
        swipeUpButton.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH+70), y:DeviceModel.SCREEN_HEIGHT-220, width: 80, height: 105)
        swipeUpButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
        
        let swipeUpGesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.handleSwipeUpInCouchMarkScreen))
        swipeUpGesture.direction = .up
        swipeUpButton.addGestureRecognizer(swipeUpGesture)

        let leftSwipeButton:UIButton = UIButton(type: .custom)
        leftSwipeButton.tag = 3
        leftSwipeButton.frame = CGRect(x: ((DeviceModel.SCREEN_WIDTH*2)+15), y: (DeviceModel.SCREEN_HEIGHT-50)/2, width: 120, height: 50)
        leftSwipeButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)

        let rightSwipeButton:UIButton = UIButton(type: .custom)
        rightSwipeButton.tag = 4
        rightSwipeButton.frame = CGRect(x: ((DeviceModel.SCREEN_WIDTH*2)+DeviceModel.SCREEN_WIDTH/2)+50, y: (DeviceModel.SCREEN_HEIGHT-50)/2, width: 120, height: 50)
        rightSwipeButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
        
        let infoButton:UIButton = UIButton(type: .custom)
        infoButton.tag = 5
        infoButton.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH*3)+40, y: 17, width: 50, height: 80)
        infoButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
        
        let menuButton:UIButton = UIButton(type: .custom)
        menuButton.tag = 6
        menuButton.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH*4)-50, y: 17, width: 50, height: 80)
        menuButton.addTarget(mathsFactsVCDelegate, action: #selector(mathsFactsVCDelegate.couchmarkButtonAction), for: .touchUpInside)
       mathsFactsVCDelegate.couchmarkScrollView.isPagingEnabled = true
        let couchmark1ImageView:UIImageView = UIImageView.init(image:#imageLiteral(resourceName: "Screen1"))
        couchmark1ImageView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: DeviceModel.SCREEN_HEIGHT)
        
        let couchmark2ImageView:UIImageView = UIImageView.init(image:#imageLiteral(resourceName: "Screen2"))
        couchmark2ImageView.frame = CGRect(x: DeviceModel.SCREEN_WIDTH, y: 0, width: DeviceModel.SCREEN_WIDTH, height: DeviceModel.SCREEN_HEIGHT)
        
        let couchmark3ImageView:UIImageView = UIImageView.init(image:#imageLiteral(resourceName: "Screen3"))
          couchmark3ImageView.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH)*2, y: 0, width: DeviceModel.SCREEN_WIDTH, height: DeviceModel.SCREEN_HEIGHT)

        let couchmark4ImageView:UIImageView = UIImageView.init(image:#imageLiteral(resourceName: "Screen4"))
        couchmark4ImageView.frame = CGRect(x: (DeviceModel.SCREEN_WIDTH)*3, y: 0, width: DeviceModel.SCREEN_WIDTH, height: DeviceModel.SCREEN_HEIGHT)
        
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(couchmark1ImageView)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(couchmark2ImageView)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(couchmark3ImageView)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(couchmark4ImageView)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(exitButton1)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(exitButton2)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(exitButton3)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(exitButton4)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(logoButton)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(homeButton)
         mathsFactsVCDelegate.couchmarkScrollView.addSubview(swipeUpButton)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(leftSwipeButton)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(rightSwipeButton)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(infoButton)
        mathsFactsVCDelegate.couchmarkScrollView.addSubview(menuButton)
       
        mathsFactsVCDelegate.couchmarkScrollView.contentSize = CGSize(width: DeviceModel.SCREEN_WIDTH*4, height: DeviceModel.SCREEN_HEIGHT)
    }
}

