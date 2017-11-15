//
//  LongDivisonViewModel.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 11/05/17.

//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class LongDivisionViewModel{
    
    var longDivisionVCDelegate:LongDivisionViewController!
       // Custom Method to initialize the swipe Gestures to all directions in the view.
    func swiperInitializeMethod()
    {
        // Swipe Left
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: longDivisionVCDelegate, action: #selector(longDivisionVCDelegate.swipeLeft(recognizer:)))
        swipeLeft.direction = .left
        longDivisionVCDelegate.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: longDivisionVCDelegate, action: #selector(longDivisionVCDelegate.swipeRight(recognizer:)))
        swipeRight.direction = .right
        longDivisionVCDelegate.view.addGestureRecognizer(swipeRight)
        
        // Swipe up
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: longDivisionVCDelegate, action: #selector(longDivisionVCDelegate.swipeUp(recognizer:)))
        swipeUp.direction = .up
        longDivisionVCDelegate.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: longDivisionVCDelegate, action: #selector(longDivisionVCDelegate.swipeDown(recognizer:)))
        swipeDown.direction = .down
        longDivisionVCDelegate.view.addGestureRecognizer(swipeDown)
    }
    // Custom Method to get the common data i.e level, range , question category from the appdelegate.
    func dataFromAppDelegate()
    {
        //Define appDelegate object so we can access common variables

        longDivisionVCDelegate.mfLevel = AppdelegateRef.appDelegate.MathFactsLevel
        print("Long Division: fetch of appDelegate mathFactsLevel \(longDivisionVCDelegate.mfLevel).")
        
        longDivisionVCDelegate.mfRange = AppdelegateRef.appDelegate.MathFactsRange
        print("Long Division: fetch of appDelegate MathFactsRange \(longDivisionVCDelegate.mfRange)")
        
        longDivisionVCDelegate.questionCategory = AppdelegateRef.appDelegate.MathFactsCatagory
        print("Long Division: fetch of appDelegate MathFactsCatagory \(longDivisionVCDelegate.questionCategory)")
    }
    
    
    // Custom method for the images design and the buttons creation.
    func initialDesign()
    {
        for index in 0...2 {
            //var imageData:Data!
            let imageData = try! Data(contentsOf: Bundle.main.url(forResource: Constant.gifsArray[index], withExtension: "gif")!)
            longDivisionVCDelegate.gifImagesArray.append(imageData)
        }
        
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
             longDivisionVCDelegate.alertPopOverView.frame = CGRect(x: longDivisionVCDelegate.alertPopOverView.frame.origin.x, y: 0, width: longDivisionVCDelegate.alertPopOverView.frame.size.width, height: longDivisionVCDelegate.alertPopOverView.frame.size.height+20)
            
            longDivisionVCDelegate.headerView.frame = CGRect(x: longDivisionVCDelegate.headerView.frame.origin.x, y: longDivisionVCDelegate.headerView.frame.origin.y-5, width: longDivisionVCDelegate.headerView.frame.size.width, height: longDivisionVCDelegate.headerView.frame.size.height)
            
             longDivisionVCDelegate.pageControl.frame =  CGRect(x:  longDivisionVCDelegate.headerView.center.x-5, y: longDivisionVCDelegate.headerView.frame.origin.y+longDivisionVCDelegate.applyFactsLbl.frame.size.height+20, width: 10, height:1)
             longDivisionVCDelegate.alertPopOverView.frame = CGRect(x: longDivisionVCDelegate.alertPopOverView.frame.origin.x, y: 0, width: longDivisionVCDelegate.alertPopOverView.frame.size.width, height: longDivisionVCDelegate.alertPopOverView.frame.size.height)
            longDivisionVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            longDivisionVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 376)
         } else {
             longDivisionVCDelegate.pageControl.frame =  CGRect(x:  longDivisionVCDelegate.headerView.center.x-5, y: longDivisionVCDelegate.headerView.frame.origin.y+longDivisionVCDelegate.applyFactsLbl.frame.size.height+17, width: 10, height:1)
        }
        
        longDivisionVCDelegate.pageControl.frame =  CGRect(x:  longDivisionVCDelegate.headerView.center.x-5, y: longDivisionVCDelegate.headerView.frame.origin.y+longDivisionVCDelegate.applyFactsLbl.frame.size.height+17, width: 10, height:1)
        longDivisionVCDelegate.pageControl.numberOfPages = 3
        longDivisionVCDelegate.pageControl.currentPage = 1
        longDivisionVCDelegate.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        longDivisionVCDelegate.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2392156863, green: 0.3960784314, blue: 0.4980392157, alpha: 1)
        longDivisionVCDelegate.headerView.addSubview(longDivisionVCDelegate.pageControl)
        
         longDivisionVCDelegate.alertPopOverView.isHidden = true
        longDivisionVCDelegate.divDropArrow2.isHidden = true
        
        longDivisionVCDelegate.divDropArrow3.isHidden = true
        
        longDivisionVCDelegate.divDropArrow4.isHidden = true
        
        /////////
        longDivisionVCDelegate.divRemArrow = UIImageView(image: #imageLiteral(resourceName: "Up Arrow 23x26") )
        
        longDivisionVCDelegate.divRemArrow.frame = CGRect(x: (longDivisionVCDelegate.dividendLabel.intrinsicContentSize.width+longDivisionVCDelegate.dividendLabel.frame.origin.x), y: (longDivisionVCDelegate.dividendLabel.intrinsicContentSize.height+longDivisionVCDelegate.dividendLabel.frame.origin.y), width: 23, height: 26)
        longDivisionVCDelegate.view.addSubview(longDivisionVCDelegate.divRemArrow)
        longDivisionVCDelegate.divRemArrow.isHidden = true
        longDivisionVCDelegate.view.bringSubview(toFront: longDivisionVCDelegate.divRemArrow)
        
        
        if DeviceModel.IS_IPHONE_5{
            
            longDivisionVCDelegate.arrowsView.frame = CGRect(x: longDivisionVCDelegate.arrowsView.frame.origin.x+4, y: longDivisionVCDelegate.arrowsView.frame.origin.y, width: longDivisionVCDelegate.arrowsView.frame.size.width, height: longDivisionVCDelegate.arrowsView.frame.size.height)
            
            longDivisionVCDelegate.divDropArrow4.frame = CGRect(x: longDivisionVCDelegate.divDropArrow4.frame.origin.x+3, y: longDivisionVCDelegate.divDropArrow4.frame.origin.y, width: longDivisionVCDelegate.divDropArrow4.frame.size.width, height: longDivisionVCDelegate.divDropArrow4.frame.size.height)
            
        } else if DeviceModel.IS_IPHONE_6 {
            longDivisionVCDelegate.arrowsView.frame = CGRect(x: longDivisionVCDelegate.arrowsView.frame.origin.x, y: longDivisionVCDelegate.arrowsView.frame.origin.y, width: longDivisionVCDelegate.arrowsView.frame.size.width, height: longDivisionVCDelegate.arrowsView.frame.size.height)
        } else if DeviceModel.IS_IPHONE_6P {
            longDivisionVCDelegate.arrowsView.frame = CGRect(x: longDivisionVCDelegate.arrowsView.frame.origin.x-2, y: longDivisionVCDelegate.arrowsView.frame.origin.y, width: longDivisionVCDelegate.arrowsView.frame.size.width, height: longDivisionVCDelegate.arrowsView.frame.size.height)
            
            longDivisionVCDelegate.divDropArrow4.frame = CGRect(x: longDivisionVCDelegate.divDropArrow4.frame.origin.x-2, y: longDivisionVCDelegate.divDropArrow4.frame.origin.y, width: longDivisionVCDelegate.divDropArrow4.frame.size.width, height: longDivisionVCDelegate.divDropArrow4.frame.size.height)
        }
                // Set up images to flash math signs after swiping
        
        let xVal = (DeviceModel.SCREEN_WIDTH-150)/2
        
        //  plus image
        longDivisionVCDelegate.iconPlusSignLarge = UIImageView(image:#imageLiteral(resourceName: "Plus205x205dot"))
        longDivisionVCDelegate.iconPlusSignLarge.frame = CGRect(x: CGFloat(xVal), y: CGFloat(30), width: CGFloat(150), height: CGFloat(150))
        longDivisionVCDelegate.view.addSubview(longDivisionVCDelegate.iconPlusSignLarge)
        longDivisionVCDelegate.iconPlusSignLarge.isHidden = false
        longDivisionVCDelegate.iconPlusSignLarge.alpha = 0.0
        // Minus Image
        longDivisionVCDelegate.iconMinusSignLarge = UIImageView(image: #imageLiteral(resourceName: "Minus205x205dot"))
        longDivisionVCDelegate.iconMinusSignLarge.frame = CGRect(x: CGFloat(xVal), y: CGFloat(30), width: CGFloat(150), height: CGFloat(150))
        longDivisionVCDelegate.view.addSubview(longDivisionVCDelegate.iconMinusSignLarge)
        longDivisionVCDelegate.iconMinusSignLarge.isHidden = false
        longDivisionVCDelegate.iconMinusSignLarge.alpha = 0.0
        
        // Times Image
        longDivisionVCDelegate.iconTimesSignLarge = UIImageView(image: #imageLiteral(resourceName: "Times205x205dot"))
        
        longDivisionVCDelegate.iconTimesSignLarge.frame =  CGRect(x: CGFloat(xVal), y: CGFloat(30), width: CGFloat(150), height: CGFloat(150))
        longDivisionVCDelegate.view.addSubview(longDivisionVCDelegate.iconTimesSignLarge)
        longDivisionVCDelegate.iconTimesSignLarge.isHidden = false
        longDivisionVCDelegate.iconTimesSignLarge.alpha = 0.0
        
        // Divide Image
        longDivisionVCDelegate.iconDivideSignLarge = UIImageView(image: #imageLiteral(resourceName: "Divide205x205dot"))
        longDivisionVCDelegate.iconDivideSignLarge.frame = CGRect(x: CGFloat(xVal), y: CGFloat(30), width: CGFloat(150), height: CGFloat(150))
        longDivisionVCDelegate.view.addSubview(longDivisionVCDelegate.iconDivideSignLarge)
        longDivisionVCDelegate.iconDivideSignLarge.isHidden = false
        longDivisionVCDelegate.iconDivideSignLarge.alpha = 0.0
        longDivisionVCDelegate.animationView.isHidden = true
        //TapGesture for PopView
        let popViewTapgeasture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: longDivisionVCDelegate, action: #selector(longDivisionVCDelegate.alertCloseBtnAction))
        popViewTapgeasture.numberOfTapsRequired = 1;
        longDivisionVCDelegate.alertPopOverView.addGestureRecognizer(popViewTapgeasture)
        
    }
    
    // Custom method to show the flash image which was select in initial screen with the fade animations.
    func flashIcon()
    {
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.ffftsoundFileObject)
        
        switch longDivisionVCDelegate.questionCategory {
        case 0: longDivisionVCDelegate.iconCurrentSignLarge = longDivisionVCDelegate.iconPlusSignLarge
            break
        case 1: longDivisionVCDelegate.iconCurrentSignLarge = longDivisionVCDelegate.iconMinusSignLarge
            break
        case 2: longDivisionVCDelegate.iconCurrentSignLarge = longDivisionVCDelegate.iconTimesSignLarge
            break
        case 3: longDivisionVCDelegate.iconCurrentSignLarge = longDivisionVCDelegate.iconDivideSignLarge
            break
        default:
            break
        }
        
        UIView.beginAnimations("fade in image", context: nil)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationCurve(.easeInOut)
        longDivisionVCDelegate.iconCurrentSignLarge.alpha = 1.0
        UIView.setAnimationDelegate(longDivisionVCDelegate)
        UIView.setAnimationDidStop(#selector(longDivisionVCDelegate.fadeAnimation))
        UIView.commitAnimations()
        
    }
    
    // Custom method to start the fade out animation to dismiss the selected flash image
    func fadeInAnimationFinished(){
        
        UIView.beginAnimations("fade out image", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelay(0.25)
        UIView.setAnimationCurve(.easeInOut)
        longDivisionVCDelegate.iconPlusSignLarge.alpha = 0.0
        longDivisionVCDelegate.iconMinusSignLarge.alpha = 0.0
        longDivisionVCDelegate.iconTimesSignLarge.alpha = 0.0
        longDivisionVCDelegate.iconDivideSignLarge.alpha = 0.0
        UIView.commitAnimations()
    }
    
    
    // Custom method to get the random numbers by using the level which was user selected.
    func getNumbers()
    {
        var indexToRndArray:Int = 1
        
        //Define appDelegate so we can access common variables
        
        switch longDivisionVCDelegate.mfLevel {
        case 0:
            repeat {
                indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
            }
                while ((AppdelegateRef.appDelegate.RandomNumSecondVal * AppdelegateRef.appDelegate.RandomNumFirstVal) > 25)
            longDivisionVCDelegate.intDividend = AppdelegateRef.appDelegate.RandomNumFirstVal * AppdelegateRef.appDelegate.RandomNumSecondVal
            longDivisionVCDelegate.intDivisor  = AppdelegateRef.appDelegate.RandomNumFirstVal
            break
        case 1:
            indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
            longDivisionVCDelegate.intDividend = Int(arc4random_uniform(UInt32(100)))
            longDivisionVCDelegate.intDivisor  = AppdelegateRef.appDelegate.RandomNumFirstVal
            break
        case 2:
            
            longDivisionVCDelegate.intDividend = Int(arc4random_uniform(UInt32(1000)))
            longDivisionVCDelegate.intDivisor = (Int(arc4random_uniform(UInt32(8)))) + 2
            break
        case 3:
            longDivisionVCDelegate.intDividend = Int(arc4random_uniform(UInt32(10000)))
            longDivisionVCDelegate.intDivisor = (Int(arc4random_uniform(UInt32(8)))) + 2
            break
        default:
            break
        }
        
        if (indexToRndArray > 1000){
            print("Long Division: indextoarray out of bounds")
        }
        
        
        if (longDivisionVCDelegate.intDivisor == 0)
        {
            print("Long Division: Divide by zero atempted in longDivision")
            // This should never happen, but just in case bump divisor.
            longDivisionVCDelegate.intDivisor = longDivisionVCDelegate.intDivisor+1
        }
        longDivisionVCDelegate.intQuotient = longDivisionVCDelegate.intDividend / longDivisionVCDelegate.intDivisor
        
        longDivisionVCDelegate.firstProductLabel.text =     ""
        longDivisionVCDelegate.firstRemPartDivLabel.text =  ""
        longDivisionVCDelegate.secondProductLabel.text =    ""
        longDivisionVCDelegate.secondRemPartDivLabel.text = ""
        longDivisionVCDelegate.thirdProductLabel.text =     ""
        longDivisionVCDelegate.thirdRemPartDivLabel.text =  ""
        longDivisionVCDelegate.fourthProductLabel.text =    ""
        longDivisionVCDelegate.fourthRemPartDivLabel.text = ""
        longDivisionVCDelegate.quotientLabel.text =  ""
        // Ajay Commented
        //longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
        longDivisionVCDelegate.firstProductLineLabel.isHidden = true
        longDivisionVCDelegate.secondProductLineLabel.isHidden = true
        longDivisionVCDelegate.thirdProductLineLabel.isHidden  = true
        longDivisionVCDelegate.fourthProductLineLabel.isHidden = true
        
        longDivisionVCDelegate.inputPhase = 0
        longDivisionVCDelegate.ErrorOnThisQuestion = false
        // Display composite equation
        longDivisionVCDelegate.divisorLabel.text  = String(longDivisionVCDelegate.intDivisor)
        longDivisionVCDelegate.dividendLabel.text = String(longDivisionVCDelegate.intDividend)
        
        if (longDivisionVCDelegate.intDividend > 9999) {
            print("Long Division: Dividend is too big to process > 9999")
            // Get new numberss
        }
        
        if (longDivisionVCDelegate.intDividend < 10)  {
            longDivisionVCDelegate.numDividendDigits = 1
            longDivisionVCDelegate.firstDigit = longDivisionVCDelegate.intDividend
            print("Long Division: Dividend\(longDivisionVCDelegate.intDividend) 1st digit\(longDivisionVCDelegate.firstDigit)")
        } else if (longDivisionVCDelegate.intDividend < 100)  {
            longDivisionVCDelegate.firstDigit  = longDivisionVCDelegate.intDividend / 100
            longDivisionVCDelegate.numDividendDigits = 2
            longDivisionVCDelegate.firstDigit  = longDivisionVCDelegate.intDividend / 10
            longDivisionVCDelegate.secondDigit = longDivisionVCDelegate.intDividend % 10
            
            print("Long Division: Dividend=\(longDivisionVCDelegate.intDividend) 1st digit=\(longDivisionVCDelegate.firstDigit), 2nd=\(longDivisionVCDelegate.secondDigit)")
        } else if (longDivisionVCDelegate.intDividend < 1000) {
            longDivisionVCDelegate.numDividendDigits = 3
            longDivisionVCDelegate.firstDigit  = longDivisionVCDelegate.intDividend / 100
            longDivisionVCDelegate.secondDigit = longDivisionVCDelegate.intDividend % 100 / 10
            longDivisionVCDelegate.thirdDigit  = longDivisionVCDelegate.intDividend % 10
            
        } else if (longDivisionVCDelegate.intDividend < 10000) {
            longDivisionVCDelegate.numDividendDigits = 4
            longDivisionVCDelegate.firstDigit  = longDivisionVCDelegate.intDividend / 1000
            longDivisionVCDelegate.secondDigit = longDivisionVCDelegate.intDividend % 1000 / 100
            longDivisionVCDelegate.thirdDigit  = longDivisionVCDelegate.intDividend % 100 / 10
            longDivisionVCDelegate.fourthDigit  = longDivisionVCDelegate.intDividend % 10
            
        }
        longDivisionVCDelegate.animationView.isHidden = true
    }
    
    func attributedStr() -> NSMutableAttributedString
    {
        let str2 = NSMutableAttributedString(string: "-", attributes: [NSFontAttributeName:UIFont(name: "SFNS Display", size: 24.0)!, NSForegroundColorAttributeName: #colorLiteral(red: 0.5137254902, green: 0.4117647059, blue: 0.2862745098, alpha: 1)])
        
        return str2
    }
    
    
    //MARK:- Swipe methods
    
    // Custom method to push to the `SpeedDrilVC` when user swipes left side.
    func handleSwipeLeft(recognizer: UISwipeGestureRecognizer)
    {
        let location: CGPoint = recognizer.location(in: longDivisionVCDelegate.view)
        print("Fact: left swipe started at (\(location.x), \(location.y))")
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kSpeedDrilVC) as! MultiSpeedDrillViewController
        nextVC.modalTransitionStyle = .flipHorizontal
         AppdelegateRef.appDelegate.islaunch = false
        longDivisionVCDelegate.present(nextVC, animated: true, completion: nil)
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        
    }
    // Custom method to push to the `MathFactsVC` when user swipes right side.
    func handleSwipeRight(recognizer: UISwipeGestureRecognizer)
    {
        let location: CGPoint = recognizer.location(in: longDivisionVCDelegate.view)
        print("Fact: left swipe started at (\(location.x), \(location.y))")
        
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMathFactsVC) as! MathFactsViewController
        nextVC.modalTransitionStyle = .flipHorizontal
         AppdelegateRef.appDelegate.islaunch = false
        longDivisionVCDelegate.present(nextVC, animated: true, completion: nil)
        
        
    }

    // Custom method to push to the `MultiAppVC` when user swipes up side.
    func handleSwipeUp(recognizer: UISwipeGestureRecognizer)
    {
        let location: CGPoint = recognizer.location(in: longDivisionVCDelegate.view)
        print("Long Division: Up swipe started at (\(location.x), \(location.y))")
        //Define appDelegate objext so we can access common variables
        
        longDivisionVCDelegate.questionCategory = 0
        flashIcon()
        /// to flash up the new math operator sign briefly
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: longDivisionVCDelegate.questionCategory)
        // Set it to Addd
        print("Long Division: Updated appDelegate with selectedSegmentBasics to \(longDivisionVCDelegate.questionCategory).")
        
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMultiAppVC) as! MultiAppViewController
        nextVC.questionCount = longDivisionVCDelegate.questionCount
        nextVC.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex
        nextVC.modalTransitionStyle = .crossDissolve
        longDivisionVCDelegate.present(nextVC, animated: true, completion: nil)
        
    }

    // Custom method to push to the `MultiAppVC` when user swipes down side.
    func handleSwipeDown(recognizer: UISwipeGestureRecognizer)
    {
        let location: CGPoint = recognizer.location(in: longDivisionVCDelegate.view)
        print("Long Division: Down swipe started at (\(location.x), \(location.y))")
        //Define appDelegate objext so we can access common variables
        
        longDivisionVCDelegate.questionCategory = 2
        flashIcon()
        /// to flash up the new math operator sign briefly
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: longDivisionVCDelegate.questionCategory)
        // Set it to Addd
        print("Long Division: Updated appDelegate with selectedSegmentBasics to \(longDivisionVCDelegate.questionCategory).")
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMultiAppVC) as! MultiAppViewController
        nextVC.questionCount = longDivisionVCDelegate.questionCount
        nextVC.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex
        nextVC.modalTransitionStyle = .crossDissolve
        longDivisionVCDelegate.present(nextVC, animated: true, completion: nil)
    }
    //This function is called when home button is selected for displaying the Animation in MathFactsViewController
    func homeButtonAction(sender: UIButton)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers
            .kMathFactsVC) as! MathFactsViewController
        AppdelegateRef.appDelegate.islaunch = true
        
        longDivisionVCDelegate.present(nextVC, animated: false, completion: nil)
        
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        
    }
    //MARK:- Custom Button Actions
     // Custom method to present the `MenuViewController`. Which is used to select the level, categori and the number range.
    func buttonMenuView()
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMenuVC) as! MenuViewController
        longDivisionVCDelegate.present(nextVC, animated: true, completion: nil)
    }
    
    
    // Custom method to do the functionality of the arithmetic operation according to the button was selected in the number pad. If user selects the correct answer it will go to the next step of arithmetic operation otherwise gives a error sound.
    func buttonWasSelected(sender:UIButton){
        
        switch longDivisionVCDelegate.inputPhase {
        // Ones Place
        case 0: // 1st digit of Quotient
            longDivisionVCDelegate.intFirstQuoDigit = longDivisionVCDelegate.firstDigit / longDivisionVCDelegate.intDivisor
            if (sender.tag == longDivisionVCDelegate.intFirstQuoDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)
                
                longDivisionVCDelegate.inputPhase = 1
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 1: // First Product (only one digit)
            longDivisionVCDelegate.intFirstProduct = (longDivisionVCDelegate.firstDigit / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor // Int division to drop remainder
            if (sender.tag == longDivisionVCDelegate.intFirstProduct) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                
                let str = attributedStr()
                str.append(NSAttributedString(string: " "))
                str.append(NSAttributedString(string: String(longDivisionVCDelegate.intFirstProduct)))
                
                 longDivisionVCDelegate.firstProductLabel.attributedText = str
                
                longDivisionVCDelegate.firstProductLineLabel.isHidden = false
                longDivisionVCDelegate.inputPhase = 2
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 2: // 1st digit of First Remainder
            longDivisionVCDelegate.intFirstRem = longDivisionVCDelegate.firstDigit - longDivisionVCDelegate.intFirstProduct
            if (sender.tag == longDivisionVCDelegate.intFirstRem) {
                
                longDivisionVCDelegate.firstRemPartDivLabel.text = String(longDivisionVCDelegate.intFirstRem)
                
                longDivisionVCDelegate.intRemainderQuoDigit  = longDivisionVCDelegate.intFirstRem
                if (longDivisionVCDelegate.numDividendDigits == 1){
                    if (longDivisionVCDelegate.intRemainderQuoDigit == 0) {
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                        if (longDivisionVCDelegate.ErrorOnThisQuestion == false &&  (longDivisionVCDelegate.questionCount > 4))
                        {
                          longDivisionVCDelegate.animationView.isHidden = false
                            longDivisionVCDelegate.animationImage.image = UIImage.gifImageWithData(longDivisionVCDelegate.gifImagesArray[longDivisionVCDelegate.selectedGifIndex])
                            if longDivisionVCDelegate.selectedGifIndex==2
                            {
                                longDivisionVCDelegate.selectedGifIndex=0
                             } else {
                                longDivisionVCDelegate.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex+1
                            }
                          longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                            longDivisionVCDelegate.questionCount = 0
                        } else {
                           longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 4, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                        }
                        longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
                        
                        longDivisionVCDelegate.inputPhase = 999
                    } else {
                        longDivisionVCDelegate.inputPhase = 18 // Process remainder
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    }
                    
                } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    longDivisionVCDelegate.inputPhase = 3
                }
             } else {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject) //  Quack
            }
            break
            
        case 3: // 2nd digit of First Remainder
            if (sender.tag == longDivisionVCDelegate.secondDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.firstRemPartDivLabel.text = String(longDivisionVCDelegate.intFirstRem)+String(longDivisionVCDelegate.secondDigit)
                
                longDivisionVCDelegate.intFirstRem = (longDivisionVCDelegate.intFirstRem * 10) + longDivisionVCDelegate.secondDigit
                longDivisionVCDelegate.inputPhase = 4
                longDivisionVCDelegate.divDropArrow2.isHidden = true
             } else {   //  Quack
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject)
                longDivisionVCDelegate.divDropArrow2.isHidden = false
            }
            break
            
        case 4: // 2nd digit of Quotient
            longDivisionVCDelegate.intSecondQuoDigit  = (longDivisionVCDelegate.intFirstRem / longDivisionVCDelegate.intDivisor)
            if (sender.tag == longDivisionVCDelegate.intSecondQuoDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit) + String(longDivisionVCDelegate.intSecondQuoDigit)
                
                longDivisionVCDelegate.inputPhase = 5
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break

        case 5:  // 1st digit of Second Product
            longDivisionVCDelegate.intSecondProduct = (longDivisionVCDelegate.intFirstRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor // Interger math eliminates remainders
            
            if (longDivisionVCDelegate.intSecondProduct > 9) {
                longDivisionVCDelegate.intSecondProduct = longDivisionVCDelegate.intSecondProduct / 10 // Get 'tens' place (1st digit).  Interger math eliminates remainders
                if (sender.tag == longDivisionVCDelegate.intSecondProduct) {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)

                  let str = attributedStr()
                     str.append(NSAttributedString(string: "  "))
                     str.append(NSAttributedString(string: String(longDivisionVCDelegate.intSecondProduct)))
                     longDivisionVCDelegate.secondProductLabel.attributedText = str
                  
                    longDivisionVCDelegate.inputPhase = 6
                 } else {   //  Quack
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                }
                break
            }
            fallthrough // Else we will let it fall through to be processed in CASE 6 as a single digit
            
        case 6:  // 2nd digit of Second Product
            longDivisionVCDelegate.calculatedDigit = (longDivisionVCDelegate.intFirstRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor % 10 // Interger math eliminates remainders
            
            if (sender.tag == longDivisionVCDelegate.calculatedDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                if (((longDivisionVCDelegate.intFirstRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor) < 10){
                    
                    let str = attributedStr()
                    str.append(NSAttributedString(string: "   "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.calculatedDigit)))
                    
                    longDivisionVCDelegate.secondProductLabel.attributedText = str
                    
                    // Note TWO leading space (no 'tens' place)
                } else {
                    longDivisionVCDelegate.intSecondProduct = (longDivisionVCDelegate.intFirstRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor
                    
                   let str = attributedStr()
                    str.append(NSAttributedString(string: " "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.intSecondProduct)))
                    
                    longDivisionVCDelegate.secondProductLabel.attributedText = str
                    
                    // Over with 1 digit with 2 digit value
                }
                longDivisionVCDelegate.secondProductLineLabel.isHidden = false
                longDivisionVCDelegate.inputPhase = 7
             } else {  //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 7: // 1st digit of Second Remainder
            longDivisionVCDelegate.intSecondRem = longDivisionVCDelegate.intFirstRem - longDivisionVCDelegate.intSecondProduct
            if (sender.tag == longDivisionVCDelegate.intSecondRem) {
                longDivisionVCDelegate.secondRemPartDivLabel.text = String(longDivisionVCDelegate.intSecondRem)
                
                longDivisionVCDelegate.intRemainderQuoDigit  = longDivisionVCDelegate.intSecondRem
                if (longDivisionVCDelegate.numDividendDigits == 2){
                    if (longDivisionVCDelegate.intRemainderQuoDigit == 0) {
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                        
                        if (longDivisionVCDelegate.ErrorOnThisQuestion == false &&  (longDivisionVCDelegate.questionCount > 4))
                        {
                            longDivisionVCDelegate.animationView.isHidden = false
                            
                            longDivisionVCDelegate.animationImage.image = UIImage.gifImageWithData(longDivisionVCDelegate.gifImagesArray[longDivisionVCDelegate.selectedGifIndex])
                            if longDivisionVCDelegate.selectedGifIndex==2
                            {
                                longDivisionVCDelegate.selectedGifIndex=0
                               
                            } else {
                                longDivisionVCDelegate.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex+1
                            }
                            longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                            longDivisionVCDelegate.questionCount = 0
                        } else {
                            longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 4, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                        }
                        longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
                        longDivisionVCDelegate.inputPhase = 999
                    } else {
                        longDivisionVCDelegate.inputPhase = 18 // Process remainder
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    }
                } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    longDivisionVCDelegate.inputPhase = 8
                }
            } else {
                
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject) //  Quack
            }
            break
            
        case 8: // 2nd digit of Second Remainder
            if (sender.tag == longDivisionVCDelegate.thirdDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                
                longDivisionVCDelegate.secondRemPartDivLabel.text = String(longDivisionVCDelegate.intSecondRem)+String(longDivisionVCDelegate.thirdDigit)
                
                longDivisionVCDelegate.intSecondRem = (longDivisionVCDelegate.intSecondRem * 10) + longDivisionVCDelegate.thirdDigit
                
                longDivisionVCDelegate.inputPhase = 9
                longDivisionVCDelegate.divDropArrow3.isHidden = true
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                longDivisionVCDelegate.divDropArrow3.isHidden = false
            }
            break
            
        case 9: // 3rd digit of Quotient
            longDivisionVCDelegate.intThirdQuoDigit  = (longDivisionVCDelegate.intSecondRem / longDivisionVCDelegate.intDivisor)
            if (sender.tag == longDivisionVCDelegate.intThirdQuoDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)+String(longDivisionVCDelegate.intSecondQuoDigit)+String(longDivisionVCDelegate.intThirdQuoDigit)
                
                longDivisionVCDelegate.inputPhase = 10
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 10:  // 1st digit of Third Product
            longDivisionVCDelegate.intThirdProduct = (longDivisionVCDelegate.intSecondRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor // Interger math eliminates remainders
            
            if (longDivisionVCDelegate.intThirdProduct > 9) {
                longDivisionVCDelegate.intThirdProduct = longDivisionVCDelegate.intThirdProduct / 10 // Get 'tens' place (1st digit).  Interger math eliminates remainders
                if (sender.tag == longDivisionVCDelegate.intThirdProduct) {
                    
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                    
                    let str = attributedStr()
                    str.append(NSAttributedString(string: "  "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.intThirdProduct)))
                    
                    longDivisionVCDelegate.thirdProductLabel.attributedText = str
                    
                    longDivisionVCDelegate.inputPhase = 11
                } else {   //  Quack
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                }
                break
            }
            fallthrough // Else we will let it fall through to be processed in CASE 11 as a single digit
            
            
        case 11:  // 2nd digit of Third Product
            longDivisionVCDelegate.calculatedDigit = ((longDivisionVCDelegate.intSecondRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor) % 10 // Interger math eliminates remainders
            
            if (sender.tag == longDivisionVCDelegate.calculatedDigit) {
                
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                if (((longDivisionVCDelegate.intSecondRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor) < 10)
                {
                    let str = attributedStr()
                    str.append(NSAttributedString(string: "   "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.calculatedDigit)))
                    
                     longDivisionVCDelegate.thirdProductLabel.attributedText = str
                    
                } else {
                    longDivisionVCDelegate.intThirdProduct = (longDivisionVCDelegate.intSecondRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor
                  
                    let str = attributedStr()
                    str.append(NSAttributedString(string: " "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.intThirdProduct)))
                    longDivisionVCDelegate.thirdProductLabel.attributedText = str
                }
                longDivisionVCDelegate.thirdProductLineLabel.isHidden = false
                longDivisionVCDelegate.inputPhase = 12
            } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 12: // 1st digit of Third Remainder
            longDivisionVCDelegate.intThirdRem = longDivisionVCDelegate.intSecondRem - longDivisionVCDelegate.intThirdProduct
            if (sender.tag == longDivisionVCDelegate.intThirdRem) {
                
                longDivisionVCDelegate.thirdRemPartDivLabel.text = String(longDivisionVCDelegate.intThirdRem)
                
                longDivisionVCDelegate.intRemainderQuoDigit  = longDivisionVCDelegate.intThirdRem
                if (longDivisionVCDelegate.numDividendDigits == 3){
                    if (longDivisionVCDelegate.intRemainderQuoDigit == 0) {
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                        if (longDivisionVCDelegate.ErrorOnThisQuestion == false &&  (longDivisionVCDelegate.questionCount > 4))
                        {
                         longDivisionVCDelegate.animationView.isHidden = false
                            longDivisionVCDelegate.animationImage.image = UIImage.gifImageWithData(longDivisionVCDelegate.gifImagesArray[longDivisionVCDelegate.selectedGifIndex])
                            if longDivisionVCDelegate.selectedGifIndex==2
                            {
                                longDivisionVCDelegate.selectedGifIndex=0
                                
                            } else {
                                
                                longDivisionVCDelegate.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex+1
                            }
                        longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                            longDivisionVCDelegate.questionCount = 0
                        } else {
                           longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 4, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                        }
                        longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
                        
                        longDivisionVCDelegate.inputPhase = 999
                        
                    } else {
                        longDivisionVCDelegate.inputPhase = 18 // Process remainder
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    }
                    
                } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    longDivisionVCDelegate.inputPhase = 13
                }
            } else {
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject) //  Quack
            }
            break
            
        case 13: // 2nd digit of Third Remainder
            if (sender.tag == longDivisionVCDelegate.fourthDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.thirdRemPartDivLabel.text = String(longDivisionVCDelegate.intThirdRem)+String(longDivisionVCDelegate.fourthDigit)
                
                longDivisionVCDelegate.intThirdRem = (longDivisionVCDelegate.intThirdRem * 10) + longDivisionVCDelegate.fourthDigit
                longDivisionVCDelegate.inputPhase = 14
                longDivisionVCDelegate.divDropArrow4.isHidden = true
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
                longDivisionVCDelegate.divDropArrow4.isHidden = false
            }
            break
            
        case 14: // 4th digit of Quotient
            longDivisionVCDelegate.intFourthQuoDigit  = (longDivisionVCDelegate.intThirdRem / longDivisionVCDelegate.intDivisor)
            if (sender.tag == longDivisionVCDelegate.intFourthQuoDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                
                longDivisionVCDelegate.quotientLabel.text =
                    String(longDivisionVCDelegate.intFirstQuoDigit)+String(longDivisionVCDelegate.intSecondQuoDigit)+String(longDivisionVCDelegate.intThirdQuoDigit)+String(longDivisionVCDelegate.intFourthQuoDigit)
                
                longDivisionVCDelegate.inputPhase = 15
             } else {   //  Quack
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 15:  // 1st digit of Fourth Product
            
            longDivisionVCDelegate.intFourthProduct = (longDivisionVCDelegate.intThirdRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor // Interger math eliminates remainders
            
            if (longDivisionVCDelegate.intFourthProduct > 9) {
                longDivisionVCDelegate.intFourthProduct = longDivisionVCDelegate.intFourthProduct / 10 // Get 'tens' place (1st digit).  Interger math eliminates remainders
                if (sender.tag == longDivisionVCDelegate.intFourthProduct) {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                    
                    let str = attributedStr()
                    str.append(NSAttributedString(string: "  "))
                     str.append(NSAttributedString(string: String(longDivisionVCDelegate.intFourthProduct)))
                     
                     longDivisionVCDelegate.fourthProductLabel.attributedText = str
                    
                    
                    longDivisionVCDelegate.inputPhase = 16
                 } else {//  Quack
                    AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject)
                }
                break
            }
            fallthrough
            
        case 16:  // 2nd digit of Fourth Product
            longDivisionVCDelegate.calculatedDigit = ((longDivisionVCDelegate.intThirdRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor) % 10 // Interger math eliminates remainders
            
            if (sender.tag == longDivisionVCDelegate.calculatedDigit) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                if (((longDivisionVCDelegate.intThirdRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor) < 10)
                {
                    let str = attributedStr()
                    str.append(NSAttributedString(string: "   "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.calculatedDigit)))
                    
                    longDivisionVCDelegate.fourthProductLabel.attributedText = str
                    
                    // Note leading space (no 'tens' place)
                 } else {
                    
                    longDivisionVCDelegate.intFourthProduct = (longDivisionVCDelegate.intThirdRem / longDivisionVCDelegate.intDivisor) * longDivisionVCDelegate.intDivisor
                    
                    
                    let str = attributedStr()
                    str.append(NSAttributedString(string: " "))
                    str.append(NSAttributedString(string: String(longDivisionVCDelegate.intFourthProduct)))
                    
                     longDivisionVCDelegate.fourthProductLabel.attributedText = str
                    
                    // Over with 1 digit with 2 digit value
                }
                
                longDivisionVCDelegate.fourthProductLineLabel.isHidden = false
                longDivisionVCDelegate.inputPhase = 17
            } else {  //  Quack
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        case 17: // 1st digit of Fourth Remainder
            longDivisionVCDelegate.intFourthRem = longDivisionVCDelegate.intThirdRem - longDivisionVCDelegate.intFourthProduct
            if (sender.tag == longDivisionVCDelegate.intFourthRem) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                longDivisionVCDelegate.fourthRemPartDivLabel.text = String(longDivisionVCDelegate.intFourthRem)
                
                longDivisionVCDelegate.intRemainderQuoDigit  = longDivisionVCDelegate.intFourthRem
                
                if (longDivisionVCDelegate.numDividendDigits == 4){
                    if (longDivisionVCDelegate.intRemainderQuoDigit == 0) {
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                        if (longDivisionVCDelegate.ErrorOnThisQuestion == false &&  (longDivisionVCDelegate.questionCount > 4))
                        {
                            longDivisionVCDelegate.animationView.isHidden = false
                            longDivisionVCDelegate.animationImage.image = UIImage.gifImageWithData(longDivisionVCDelegate.gifImagesArray[longDivisionVCDelegate.selectedGifIndex])
                            if longDivisionVCDelegate.selectedGifIndex==2
                            {
                                longDivisionVCDelegate.selectedGifIndex=0
                             } else {
                                longDivisionVCDelegate.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex+1
                            }
                            longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                            longDivisionVCDelegate.questionCount = 0
                         } else {
                            longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 4, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                        }
                        longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
                        longDivisionVCDelegate.inputPhase = 999
                        
                    } else {
                        longDivisionVCDelegate.inputPhase = 18 // Process remainder
                        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    }
                    
                } else {
                    AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // Click
                    longDivisionVCDelegate.inputPhase = 18
                }
            } else {
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject) //  Quack
            }
            break
            
        case 18: // Remainder of Quotient
            if (sender.tag == 10) {
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject)
                if (longDivisionVCDelegate.numDividendDigits == 1)
                {
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)+" r."
                } else if (longDivisionVCDelegate.numDividendDigits == 2){
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit) + String(longDivisionVCDelegate.intSecondQuoDigit)+" r."
                } else if (longDivisionVCDelegate.numDividendDigits == 3){
                    
                    longDivisionVCDelegate.quotientLabel.text =
                        String(longDivisionVCDelegate.intFirstQuoDigit) + String(longDivisionVCDelegate.intSecondQuoDigit) + String(longDivisionVCDelegate.intThirdQuoDigit)+" r."
                } else if (longDivisionVCDelegate.numDividendDigits == 4){
                    
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit) + String(longDivisionVCDelegate.intSecondQuoDigit) + String(longDivisionVCDelegate.intThirdQuoDigit) + String(longDivisionVCDelegate.intFourthQuoDigit)+" r."
                }
                longDivisionVCDelegate.inputPhase = 19
                longDivisionVCDelegate.divRemArrow.isHidden = true
             } else {   //  Quack
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject)
                longDivisionVCDelegate.divRemArrow.isHidden = false
                longDivisionVCDelegate.view.bringSubview(toFront: longDivisionVCDelegate.divRemArrow)
            }
            break
            
        case 19: // Remainder of Quotient
            if (sender.tag == longDivisionVCDelegate.intRemainderQuoDigit) {
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.dingsoundFileObject)
                
                if (longDivisionVCDelegate.numDividendDigits == 1)
                {
                    longDivisionVCDelegate.quotientLabel.text =
                        String(longDivisionVCDelegate.intFirstQuoDigit)+" r."+String(longDivisionVCDelegate.intRemainderQuoDigit)
                } else if (longDivisionVCDelegate.numDividendDigits == 2)
                {
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)+String(longDivisionVCDelegate.intSecondQuoDigit)+" r."+String(longDivisionVCDelegate.intRemainderQuoDigit)
                } else if (longDivisionVCDelegate.numDividendDigits == 3){
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)+String(longDivisionVCDelegate.intSecondQuoDigit)+String(longDivisionVCDelegate.intThirdQuoDigit)+" r."+String(longDivisionVCDelegate.intRemainderQuoDigit)
                } else if (longDivisionVCDelegate.numDividendDigits == 4){
                    
                    longDivisionVCDelegate.quotientLabel.text = String(longDivisionVCDelegate.intFirstQuoDigit)+String(longDivisionVCDelegate.intSecondQuoDigit)+String(longDivisionVCDelegate.intThirdQuoDigit)+String(longDivisionVCDelegate.intFourthQuoDigit)+" r."+String(longDivisionVCDelegate.intRemainderQuoDigit)
                }
                if (longDivisionVCDelegate.ErrorOnThisQuestion == false &&  (longDivisionVCDelegate.questionCount > 4))
                {

                    longDivisionVCDelegate.animationView.isHidden = false
                    longDivisionVCDelegate.animationImage.image = UIImage.gifImageWithData(longDivisionVCDelegate.gifImagesArray[longDivisionVCDelegate.selectedGifIndex])
                    if longDivisionVCDelegate.selectedGifIndex==2
                    {
                        longDivisionVCDelegate.selectedGifIndex=0
                       
                    } else {
                        
                        longDivisionVCDelegate.selectedGifIndex = longDivisionVCDelegate.selectedGifIndex+1
                    }
                    longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                    longDivisionVCDelegate.questionCount = 0
                 } else {
                    longDivisionVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 4, target: longDivisionVCDelegate, selector: #selector(longDivisionVCDelegate.getNewNumber), userInfo: nil, repeats: false)
                }
                longDivisionVCDelegate.questionCount = longDivisionVCDelegate.questionCount+1
                longDivisionVCDelegate.inputPhase = 999
             } else {   //  Quack
                AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.soundFileObject)
            }
            break
            
        default:
            break
        }
    }
}
