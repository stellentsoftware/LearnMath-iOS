//
//  MultiAppViewModel.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/15/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class MultiAppViewModel{
    
    var multiAppVCDelegate:MultiAppViewController!
   
    // Custom method for the images design and the buttons creation and also set the frames for views.
    func initialloading()
    {
         multiAppVCDelegate.alertPopOverView.isHidden = true
        multiAppVCDelegate.animationView.isHidden = true
        for index in 0...2 {
            //var imageData:Data!
            let imageData = try! Data(contentsOf: Bundle.main.url(forResource: Constant.gifsArray[index], withExtension: "gif")!)
            multiAppVCDelegate.gifImagesArray.append(imageData)
        }

        // Adding frame for the pagecontrol initially
        multiAppVCDelegate.pageControl.frame = CGRect(x:  multiAppVCDelegate.pageControl.frame.origin.x, y: multiAppVCDelegate.applyFactsLbl.frame.origin.y+multiAppVCDelegate.applyFactsLbl.frame.size.height+5, width: multiAppVCDelegate.pageControl.frame.size.width, height: 5)
        multiAppVCDelegate.isRandom = true

        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
            multiAppVCDelegate.headerView.frame = CGRect(x: multiAppVCDelegate.headerView.frame.origin.x, y: multiAppVCDelegate.headerView.frame.origin.y-5, width: multiAppVCDelegate.headerView.frame.size.width, height: multiAppVCDelegate.headerView.frame.size.height)
            
            multiAppVCDelegate.pageControl.frame =  CGRect(x:  multiAppVCDelegate.headerView.center.x-5, y: multiAppVCDelegate.headerView.frame.origin.y+multiAppVCDelegate.applyFactsLbl.frame.size.height+20, width: 10, height:1)
            
            multiAppVCDelegate.hundredsCarryLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarryLbl.frame.origin.x-3 , y: multiAppVCDelegate.hundredsCarryLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarryLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarryLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarryLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarryLbl.frame.origin.x-3, y: multiAppVCDelegate.thousandsCarryLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarryLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarryLbl.frame.size.height)
            
             multiAppVCDelegate.firstNumber_LargeLbl.frame = CGRect(x: multiAppVCDelegate.firstNumber_LargeLbl.frame.origin.x, y: multiAppVCDelegate.firstNumber_LargeLbl.frame.origin.y+5, width: multiAppVCDelegate.firstNumber_LargeLbl.frame.size.width, height: multiAppVCDelegate.firstNumber_LargeLbl.frame.size.height)
            
             multiAppVCDelegate.numbersView.frame = CGRect(x: multiAppVCDelegate.numbersView.frame.origin.x, y: multiAppVCDelegate.numbersView.frame.origin.y+10, width: multiAppVCDelegate.numbersView.frame.size.width, height: multiAppVCDelegate.numbersView.frame.size.height)
            
             multiAppVCDelegate.firstResult_LargeLbl.frame = CGRect(x: multiAppVCDelegate.firstResult_LargeLbl.frame.origin.x, y: multiAppVCDelegate.firstResult_LargeLbl.frame.origin.y+10, width: multiAppVCDelegate.firstResult_LargeLbl.frame.size.width, height: multiAppVCDelegate.firstResult_LargeLbl.frame.size.height)

            multiAppVCDelegate.secondResult_LargeLbl.frame = CGRect(x: multiAppVCDelegate.secondResult_LargeLbl.frame.origin.x, y: multiAppVCDelegate.secondResult_LargeLbl.frame.origin.y+10, width: multiAppVCDelegate.secondResult_LargeLbl.frame.size.width, height: multiAppVCDelegate.secondResult_LargeLbl.frame.size.height)
            
             multiAppVCDelegate.finalAnswerView.frame = CGRect(x: multiAppVCDelegate.finalAnswerView.frame.origin.x-10, y: multiAppVCDelegate.finalAnswerView.frame.origin.y+8, width: multiAppVCDelegate.finalAnswerView.frame.size.width+10, height: multiAppVCDelegate.finalAnswerView.frame.size.height)
            
             multiAppVCDelegate.finalresponseCarryView.frame = CGRect(x: multiAppVCDelegate.finalresponseCarryView.frame.origin.x-2, y: multiAppVCDelegate.finalresponseCarryView.frame.origin.y+7, width: multiAppVCDelegate.finalresponseCarryView.frame.size.width, height: multiAppVCDelegate.finalresponseCarryView.frame.size.height)
            
            multiAppVCDelegate.sumLine_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumLine_LargeLbl.frame.origin.x, y: multiAppVCDelegate.sumLine_LargeLbl.frame.origin.y+6, width: multiAppVCDelegate.sumLine_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumLine_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.x-2, y: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.x-1, y: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.x+1, y: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.height)
            
             multiAppVCDelegate.alertPopOverView.frame = CGRect(x: multiAppVCDelegate.alertPopOverView.frame.origin.x, y:0, width: multiAppVCDelegate.alertPopOverView.frame.size.width, height: multiAppVCDelegate.alertPopOverView.frame.size.height+20)
            
            multiAppVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            multiAppVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 430)
        } else if DeviceModel.IS_IPHONE_5
         {
            // Frames for carry Lbls for Addition ,subtraction, Small Multiplication (Multiplication)
            multiAppVCDelegate.onesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.tensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.x-2, y: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.hundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.x-3 , y: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.x-1, y: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.height)
            
            // Frames for carry for adding after multiplication carry Lbls (Multiplication)
            
            multiAppVCDelegate.sumOnesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.tensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.hundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.x-2, y: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.x-1, y: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.x-2, y: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.x-3, y: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.height)
        }
        if DeviceModel.IS_IPHONE_6{
            
            // Frames for carry Lbls for Addition ,subtraction, Small Multiplication (Multiplication)
            // Adding frames Addition ,subtraction, Small Multiplication for iPhone6

            // Frames for respCarry Lbls (Substraction, Addition)
            multiAppVCDelegate.onesCarryLbl.frame = CGRect(x: multiAppVCDelegate.onesCarryLbl.frame.origin.x + 5, y: multiAppVCDelegate.onesCarryLbl.frame.origin.y, width: multiAppVCDelegate.onesCarryLbl.frame.size.width, height: multiAppVCDelegate.onesCarryLbl.frame.size.height)
            
            multiAppVCDelegate.tensCarryLbl.frame = CGRect(x: multiAppVCDelegate.tensCarryLbl.frame.origin.x + 5, y: multiAppVCDelegate.tensCarryLbl.frame.origin.y, width: multiAppVCDelegate.tensCarryLbl.frame.size.width, height: multiAppVCDelegate.tensCarryLbl.frame.size.height)
            
            multiAppVCDelegate.hundredsCarryLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarryLbl.frame.origin.x + 9.5, y: multiAppVCDelegate.hundredsCarryLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarryLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarryLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarryLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarryLbl.frame.origin.x + 8.8, y: multiAppVCDelegate.thousandsCarryLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarryLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarryLbl.frame.size.height)
            
            
            // Frames for multiplication carry Lbls (Multiplication)
            
            multiAppVCDelegate.onesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.tensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.x + 2, y: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.hundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.x + 3, y: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.x + 9, y: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.height)
            
            // Frames for carry for adding after multiplication carry Lbls (Multiplication)
            
            multiAppVCDelegate.sumOnesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.origin.x+2, y: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.x+7, y: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.origin.x+10, y: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.x+9, y: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.x+7, y: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.height)
            
        } else if DeviceModel.IS_IPHONE_6P
        {// Adding frames for all carry labels for iPhone6plus
            
            // Frames for respCarry Lbls (Substraction, Addition,multiplication(small))
            multiAppVCDelegate.onesCarryLbl.frame = CGRect(x: multiAppVCDelegate.onesCarryLbl.frame.origin.x + 10, y: multiAppVCDelegate.onesCarryLbl.frame.origin.y, width: multiAppVCDelegate.onesCarryLbl.frame.size.width, height: multiAppVCDelegate.onesCarryLbl.frame.size.height)
            
             multiAppVCDelegate.tensCarryLbl.frame = CGRect(x: multiAppVCDelegate.tensCarryLbl.frame.origin.x + 11, y: multiAppVCDelegate.tensCarryLbl.frame.origin.y, width: multiAppVCDelegate.tensCarryLbl.frame.size.width, height: multiAppVCDelegate.tensCarryLbl.frame.size.height)
            
               multiAppVCDelegate.hundredsCarryLbl.frame = CGRect(x: 45, y: multiAppVCDelegate.hundredsCarryLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarryLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarryLbl.frame.size.height)
           
              multiAppVCDelegate.thousandsCarryLbl.frame = CGRect(x: 21, y: multiAppVCDelegate.thousandsCarryLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarryLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarryLbl.frame.size.height)
             multiAppVCDelegate.answer1View.frame = CGRect(x: multiAppVCDelegate.answer1View.frame.origin.x + 10, y: multiAppVCDelegate.answer1View.frame.origin.y, width: multiAppVCDelegate.answer1View.frame.size.width-10, height: multiAppVCDelegate.answer1View.frame.size.height)
            
            // Frames for multiplication carry Lbls (Multiplication)
            
            multiAppVCDelegate.onesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.x+8, y: multiAppVCDelegate.onesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.onesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.tensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.x + 6, y: multiAppVCDelegate.tensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.tensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.hundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.x + 7.5, y: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.hundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.thousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.x + 16, y: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.thousandsCarry_LargeLbl.frame.size.height)
            
            
            // Frames for carry for adding after multuplication carry Lbls (Multiplication)
            
            
            multiAppVCDelegate.sumOnesCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumOnesCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTensCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.origin.x, y: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTensCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.x+12, y: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHundredsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.origin.x+16, y: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumThousandsCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.x+19, y: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumTenThousCarry_LargeLbl.frame.size.height)
            
            multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame = CGRect(x: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.x+19, y: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.origin.y, width: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.width, height: multiAppVCDelegate.sumHunThousCarry_LargeLbl.frame.size.height)
        }
        
       /// calling gesture recognizer.
        callGestures()
        
        multiAppVCDelegate.mfCategory = AppdelegateRef.appDelegate.mathFactsCatagory()
        multiAppVCDelegate.mfLevel = AppdelegateRef.appDelegate.MathFactsLevel
        multiAppVCDelegate.mfNumRange = AppdelegateRef.appDelegate.MathFactsRange
        // Get initial equation numbers
        multiAppVCDelegate.getNewNumbers()
        
        multiAppVCDelegate.elapsedTime = Timer.scheduledTimer(timeInterval: 1.0, target: multiAppVCDelegate, selector:#selector(multiAppVCDelegate.secondsCounter), userInfo: nil, repeats: true)
        
        // Set up images to flash math operators after swiping
        let xVal = (DeviceModel.SCREEN_WIDTH-150)/2
        let yVal = 92.5 //30

        
        multiAppVCDelegate.iconPlusSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Plus205x205dot"))
        let LPlusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiAppVCDelegate.iconPlusSignLarge.frame = LPlusRect
        multiAppVCDelegate.view.addSubview(multiAppVCDelegate.iconPlusSignLarge)
        multiAppVCDelegate.iconPlusSignLarge.isHidden = false
        multiAppVCDelegate.iconPlusSignLarge.alpha = 0.0
        
        
        multiAppVCDelegate.iconMinusSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Minus205x205dot"))
        let LMinusRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiAppVCDelegate.iconMinusSignLarge.frame = LMinusRect
        multiAppVCDelegate.view.addSubview(multiAppVCDelegate.iconMinusSignLarge)
        multiAppVCDelegate.iconMinusSignLarge.isHidden = false
        multiAppVCDelegate.iconMinusSignLarge.alpha = 0.0
        
        
        multiAppVCDelegate.iconTimesSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Times205x205dot"))
        let LTimesRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiAppVCDelegate.iconTimesSignLarge.frame = LTimesRect
        multiAppVCDelegate.view.addSubview(multiAppVCDelegate.iconTimesSignLarge)
        multiAppVCDelegate.iconTimesSignLarge.isHidden = false
        multiAppVCDelegate.iconTimesSignLarge.alpha = 0.0
        
        multiAppVCDelegate.iconDivideSignLarge = UIImageView.init(image:#imageLiteral(resourceName: "Divide205x205dot"))
        
        let LDivRect = CGRect(x: CGFloat(xVal), y: CGFloat(yVal), width: CGFloat(150), height: CGFloat(150))
        multiAppVCDelegate.iconDivideSignLarge.frame = LDivRect
        multiAppVCDelegate.view.addSubview(multiAppVCDelegate.iconDivideSignLarge)
        multiAppVCDelegate.iconDivideSignLarge.isHidden = false
        multiAppVCDelegate.iconDivideSignLarge.alpha = 0.0
    }
    // Custom Method to initialize the swipe Gestures to all directions in the view.
    func callGestures()
    {
        // Swipe Left
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiAppVCDelegate, action: #selector(multiAppVCDelegate.swipeLeft))
        swipeLeft.direction = .left
        multiAppVCDelegate.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiAppVCDelegate, action: #selector(multiAppVCDelegate.swipeRight))
        swipeRight.direction = .right
        multiAppVCDelegate.view.addGestureRecognizer(swipeRight)
        
        // Swipe up
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiAppVCDelegate, action: #selector(multiAppVCDelegate.swipeUp))
        swipeUp.direction = .up
        multiAppVCDelegate.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: multiAppVCDelegate, action: #selector(multiAppVCDelegate.swipeDown))
        swipeDown.direction = .down
        multiAppVCDelegate.view.addGestureRecognizer(swipeDown)
        multiAppVCDelegate.isRandom = true
        
        
        //TapGesture for PopView
        let popViewtapgeasture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: multiAppVCDelegate, action: #selector(multiAppVCDelegate.alertCloseBtnAction))
        popViewtapgeasture.numberOfTapsRequired = 1;
        multiAppVCDelegate.alertPopOverView.addGestureRecognizer(popViewtapgeasture)
    }
     // Custom mehod to show the flash image which was select in initial screen with the fade animations.
    func flashIcon()
    {
        AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.ffftsoundFileObject)
        
        switch (multiAppVCDelegate.mfCategory) {  // Selective call teh method to flash up the current Operator
        case 0: multiAppVCDelegate.iconCurrentSignLarge = multiAppVCDelegate.iconPlusSignLarge
            break
        case 1: multiAppVCDelegate.iconCurrentSignLarge = multiAppVCDelegate.iconMinusSignLarge
            break
        case 2: multiAppVCDelegate.iconCurrentSignLarge = multiAppVCDelegate.iconTimesSignLarge
            break
        case 3: multiAppVCDelegate.iconCurrentSignLarge = multiAppVCDelegate.iconDivideSignLarge
            break
        default: break
        }
        UIView.beginAnimations("fade in image", context: nil)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationCurve(.easeIn)
        multiAppVCDelegate.iconCurrentSignLarge.alpha = 1.0
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(fadeInAnimationFinished(animationID:finished:context:)))
        UIView.commitAnimations()
    }
    
    
    // Custom method to start the fade out animation to dismis the selected flash image
    @objc func fadeInAnimationFinished(animationID:String,finished:NSNumber,context:UnsafeMutableRawPointer)
    {
        UIView.beginAnimations("fade out image", context: nil)
        UIView.setAnimationDelay(0.5)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationCurve(.easeInOut)
        // On occasion an icon would not get Faded out and would stay up until it specifically was rendered again and faded out.
        // So, now fade all icons (not just the current one) to catch any that might have been left behind
        //// iconCurrentSignLarge.alphac
        multiAppVCDelegate.iconPlusSignLarge.alpha = 0.0
        multiAppVCDelegate.iconMinusSignLarge.alpha = 0.0
        multiAppVCDelegate.iconTimesSignLarge.alpha = 0.0
        multiAppVCDelegate.iconDivideSignLarge.alpha = 0.0
        UIView.commitAnimations()
    }
    
    // Custom method to do the functionality of the arithmetic operation according to the button was selected in the number pad. If user selects the correct answer it will go to the next step of arithmetic operation otherwise gives a error sound.
    func buttonDigitPressed(sender: UIButton)
    {
        multiAppVCDelegate.spaceStr = "  "
        
        switch (multiAppVCDelegate.inputPhase) {
            
        // Tens carry
        case 0:
            if (sender.tag == multiAppVCDelegate.calcTensCarry) {
                if (multiAppVCDelegate.equationSecondNum > 9) {
                    multiAppVCDelegate.tensCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcTensCarry)
                 } else {
                    multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcTensCarry)+multiAppVCDelegate.spaceStr
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            
            break
            
            
        // Ones place
        case 1:
            if (sender.tag == multiAppVCDelegate.calcOnes) {
                if ((multiAppVCDelegate.calcTensCarry > 0) && (multiAppVCDelegate.equationSecondNum < 10)) {
                    
                    
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calculatedAnswer)
                    
                 
                    multiAppVCDelegate.getNewProblem = 1
                    break
                 } else {
                    multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcOnes)+" "
                }
                
                if (multiAppVCDelegate.calculatedAnswer > 9) {
                    multiAppVCDelegate.inputPhase = 2
                    if (multiAppVCDelegate.calcHunsCarry > 0 ){
                        multiAppVCDelegate.inputPhase = 1
                    }
                 } else {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Hundreds carry
        case 2:
            if (sender.tag == multiAppVCDelegate.calcHunsCarry) {
                if (multiAppVCDelegate.equationSecondNum > 100) {
                    multiAppVCDelegate.hundredsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcHunsCarry)
                 } else {
                    multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcHunsCarry)+multiAppVCDelegate.spaceStr+String(format: "%1d",multiAppVCDelegate.calcOnes)
                }
                
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Tens place
        case 3:
            if (sender.tag == multiAppVCDelegate.calcTens) {
                if ((multiAppVCDelegate.calcHunsCarry > 0) && (multiAppVCDelegate.equationSecondNum < 100))
                {
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcHunsCarry)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    multiAppVCDelegate.getNewProblem = 1
                    break
                 } else {
                    multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                }
                
                if ((multiAppVCDelegate.calculatedAnswer % 100) == 0)
                {
                    multiAppVCDelegate.answer1Lbl.text = "00"
                    // Forces display to show multiple zeros instead of just one!
                }
                if (multiAppVCDelegate.calculatedAnswer > 99)
                {
                    multiAppVCDelegate.inputPhase = 4
                    if (multiAppVCDelegate.calcThousCarry > 0)
                    {
                        multiAppVCDelegate.inputPhase = 3
                    }
                 } else {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
        // Thousands carry
        case 4:
            if (sender.tag == multiAppVCDelegate.calcThousCarry)
            {
                
                if (multiAppVCDelegate.equationSecondNum > 1000) {
                    multiAppVCDelegate.thousandsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcThousCarry)
                 } else {
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcThousCarry)+multiAppVCDelegate.spaceStr+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    
                }
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // key click
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Hundreds place
        case 5:
            if (sender.tag == multiAppVCDelegate.calcHuns) {
                if ((multiAppVCDelegate.calcThousCarry > 0) && (multiAppVCDelegate.equationSecondNum < 1000))
                {
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcThousCarry)+String(multiAppVCDelegate.calcHuns)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    
                    multiAppVCDelegate.getNewProblem = 1
                    break
                }
                
                
                multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcHuns)+String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                
                if ((multiAppVCDelegate.calculatedAnswer % 1000) == 0)
                {
                    multiAppVCDelegate.answer1Lbl.text = "000"
                    // Forces display to show multiple zeros instead of just one!
                }
                if (multiAppVCDelegate.calculatedAnswer < 1000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
        // Thousands place
        case 6:
            if(multiAppVCDelegate.calcTenThous > 0)
            {
            if (sender.tag == multiAppVCDelegate.calcTenThous)
            {
                if multiAppVCDelegate.calcTenThous == 0
                {
                   multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcThous)+String(format: "%1d",multiAppVCDelegate.calcHuns)+String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                 } else {
                     multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcTenThous)+String(format: "%1d",multiAppVCDelegate.calcHuns)+String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                }
                
                if (multiAppVCDelegate.calculatedAnswer > 9999)
                {
                    multiAppVCDelegate.inputPhase = 7
                 } else {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
        } else {
                if (sender.tag == multiAppVCDelegate.calcThous)
                {
                       multiAppVCDelegate.answer1Lbl.text = String(format: "%1d",multiAppVCDelegate.calcThous)+String(format: "%1d",multiAppVCDelegate.calcHuns)+String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                    
                    if (multiAppVCDelegate.calculatedAnswer > 9999)
                    {
                        multiAppVCDelegate.inputPhase = 7
                     } else {
                        multiAppVCDelegate.getNewProblem = 1
                    }
                 } else {
                    multiAppVCDelegate.responseError = true
                }
            }
            break
          
            /////Ram/////
        case 7,8:
            if (sender.tag == multiAppVCDelegate.calcThous)
            {
                multiAppVCDelegate.answer1Lbl.text =  String(format: "%1d",multiAppVCDelegate.calcTenThous)+String(format: "%1d",multiAppVCDelegate.calcThous)+String(format: "%1d",multiAppVCDelegate.calcHuns)+String(format: "%1d",multiAppVCDelegate.calcTens)+String(format: "%1d",multiAppVCDelegate.calcOnes)
                
                if (multiAppVCDelegate.calculatedAnswer > 9999)
                {
                   // multiAppVCDelegate.inputPhase = 999
                    multiAppVCDelegate.getNewProblem = 1

                 } else {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Subtraction case statements start here
        case 10:
            if (multiAppVCDelegate.equationOnes  < multiAppVCDelegate.firstNumOnes ) {  // Need to regroup
                
                if (sender.tag == 10)
                {  //'10' is the TAG Id for the 'Regroup' button
                    
                    if (multiAppVCDelegate.equationTens > 0) { // We can get what we need from here
                        multiAppVCDelegate.calcTensCarry = multiAppVCDelegate.equationTens - 1
                        multiAppVCDelegate.inputPhase = 12 // next phase is this + 1 (increments on exit from case)
                    } else if (multiAppVCDelegate.equationHuns > 0) { // We can get what we need from here
                        //multiplicandRegroupSlashes.text = [NSString stringWithFormat:@"/ / /"]
                        multiAppVCDelegate.slashHunsStr = "∖"
                        multiAppVCDelegate.calcHunsCarry = multiAppVCDelegate.equationHuns - 1
                        multiAppVCDelegate.calcTensCarry  =  9
                        multiAppVCDelegate.inputPhase = 11 // next phase is this + 1 (increments on exit from case)
                    } else if (multiAppVCDelegate.equationThous > 0) { // We can get what we need from here
                        //multiplicandRegroupSlashes.text = [NSString stringWithFormat:@"/ / / /"]
                        multiAppVCDelegate.slashThousStr = "∖"
                        multiAppVCDelegate.slashHunsStr  = "∖"
                        multiAppVCDelegate.calcThousCarry = multiAppVCDelegate.equationThous - 1
                        multiAppVCDelegate.calcHunsCarry  =  9
                        multiAppVCDelegate.calcTensCarry  =  9
                        multiAppVCDelegate.inputPhase = 10 // next phase is this + 1 (increments on exit from case)
                    }
                    multiAppVCDelegate.calcOnesCarry = multiAppVCDelegate.equationOnes + 10
                    multiAppVCDelegate.TensCarryAlreadySet = true
                    multiAppVCDelegate.slashOnesStr = "∖"
                    multiAppVCDelegate.slashTensStr = "∖"
                 } else {
                    multiAppVCDelegate.responseError = true
                }
           } else {// No regrouping required
                if (sender.tag == multiAppVCDelegate.calcOnes)
                {
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcOnes)
                    
                    multiAppVCDelegate.inputPhase = 16 // next phase is this + 1 (increments on exit from case)
                    if (multiAppVCDelegate.calculatedAnswer < 10)
                    {
                        multiAppVCDelegate.getNewProblem = 1  // Exit route if answer is complete already
                    }
                 } else {
                    multiAppVCDelegate.responseError = true
                }
            }
            break
            
        case 11: // Thousands regroup
            if (sender.tag ==  multiAppVCDelegate.calcThousCarry)
            {
                multiAppVCDelegate.thousandsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcThousCarry)
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
        case 12: // Hundreds Regroup
            if (sender.tag == multiAppVCDelegate.calcHunsCarry) {
                multiAppVCDelegate.hundredsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcHunsCarry)
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 13: // Tens Regroup
            if (sender.tag == multiAppVCDelegate.calcTensCarry) {
                multiAppVCDelegate.tensCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcTensCarry)
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        case 14: // Ones Regroup first digit
            if (sender.tag == 1) {
                multiAppVCDelegate.onesCarryLbl.text = "1"
                
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        case 15: // Ones Regroup second digit
            if (sender.tag == multiAppVCDelegate.equationOnes % 10) {
                multiAppVCDelegate.onesCarryLbl.text = String(multiAppVCDelegate.calcOnesCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        case 16:
            if (sender.tag == multiAppVCDelegate.calcOnes) {
                multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcOnes)
                if (multiAppVCDelegate.calculatedAnswer < 10) {
                    multiAppVCDelegate.getNewProblem = 1
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 17: // May need to regroup here
            if (((multiAppVCDelegate.calcTensCarry >= 0) && (multiAppVCDelegate.calcTensCarry < multiAppVCDelegate.firstNumTens)) ||     // An additional regroup is required
                ((multiAppVCDelegate.calcTensCarry < 0 ) && (multiAppVCDelegate.equationTens < multiAppVCDelegate.firstNumTens )))
            {                                // A first regroup is required
                if (sender.tag == 10)
                {  //'10' is the TAG Id for the 'Regroup' button
                    if (multiAppVCDelegate.equationHuns > 0) { // We can get what we need from here
                        multiAppVCDelegate.slashHunsStr = "∖"
                        multiAppVCDelegate.calcHunsCarry = multiAppVCDelegate.equationHuns - 1
                        multiAppVCDelegate.inputPhase = 18 // next phase is this + 1 (increments on exit from case)
                    } else if (multiAppVCDelegate.equationThous > 0) { // We can get what we need from here
                        multiAppVCDelegate.slashThousStr = "∖"
                        multiAppVCDelegate.slashHunsStr  = "∖"
                        multiAppVCDelegate.calcThousCarry = multiAppVCDelegate.equationThous - 1
                        multiAppVCDelegate.calcHunsCarry  =  9
                        multiAppVCDelegate.inputPhase = 17 // next phase is this + 1 (increments on exit from case)
                    }
                    if (multiAppVCDelegate.TensCarryAlreadySet)
                    {
                        multiAppVCDelegate.calcTensCarry += 10
                     } else {
                        multiAppVCDelegate.calcTensCarry = 10
                    }
                    multiAppVCDelegate.slashTensStr = "∖"
                 } else {
                    multiAppVCDelegate.responseError = true
                }
             } else {// No regrouping required
                if (sender.tag == multiAppVCDelegate.calcTens) {
                    multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    
                    multiAppVCDelegate.inputPhase = 22 // next phase is this + 1 (increments on exit from case)
                    if (multiAppVCDelegate.calculatedAnswer < 100)
                    {
                        multiAppVCDelegate.getNewProblem = 1 // Exit route if answer is complete already
                    }
                 } else {
                    multiAppVCDelegate.responseError = true
                }
            }
            break
            
        case 18: // Thousands regroup
            if (sender.tag ==  multiAppVCDelegate.calcThousCarry)
            {
                multiAppVCDelegate.thousandsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcThousCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 19: // Hundreds Regroup
            if (sender.tag == multiAppVCDelegate.calcHunsCarry) {
                multiAppVCDelegate.hundredsCarryLbl.text = String(format: "%1d",multiAppVCDelegate.calcHunsCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 20: // Tens Regroup first digit
            if (sender.tag == 1) {
                if (multiAppVCDelegate.TensCarryAlreadySet) {
                    multiAppVCDelegate.tensCarryLbl.text = String(multiAppVCDelegate.calcTensCarry)
                    multiAppVCDelegate.inputPhase = 21
                 } else {
                    multiAppVCDelegate.calcTensCarry = multiAppVCDelegate.equationTens + 10
                    multiAppVCDelegate.tensCarryLbl.text = "1"
                    //[NSString stringWithFormat:@"%d", 1]
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 21: // Tens Regroup second digit
            if (sender.tag == multiAppVCDelegate.calcTensCarry % 10) {
                multiAppVCDelegate.tensCarryLbl.text = String(multiAppVCDelegate.calcTensCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 22:  //Response 10's place
            if (sender.tag == multiAppVCDelegate.calcTens) {
                multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                if (multiAppVCDelegate.calculatedAnswer < 100)
                {
                    multiAppVCDelegate.getNewProblem = 1  // Exit route if answer is complete already
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 23:  //Response 100's place
            if (sender.tag == multiAppVCDelegate.calcHuns)
            {
                multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcHuns)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                if (multiAppVCDelegate.calculatedAnswer < 1000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        case 24:   //Response 1000's place
            if (sender.tag == multiAppVCDelegate.calcThous)
            {
                multiAppVCDelegate.answer1Lbl.text = String(multiAppVCDelegate.calcThous)+String(multiAppVCDelegate.calcHuns)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                
                
                if (multiAppVCDelegate.calculatedAnswer < 10000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Tens carry
        case 100:
            if (sender.tag == multiAppVCDelegate.altOnesCalcTensCarry) {
                if (multiAppVCDelegate.equationSecondNum > 9)
                {
                    multiAppVCDelegate.tensCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altOnesCalcTensCarry)
                 } else {
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altOnesCalcTensCarry)+multiAppVCDelegate.spaceStr
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Ones place
        case 101:
            if (sender.tag == multiAppVCDelegate.calcOnes) {
                if ((multiAppVCDelegate.altOnesCalcTensCarry > 0) && (multiAppVCDelegate.equationSecondNum < 10)) {
                    multiAppVCDelegate.finalAnswer_LargeLbl.text = String(multiAppVCDelegate.calculatedAnswer)
                    multiAppVCDelegate.getNewProblem = 1
                    break
                 } else {
                    
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcOnes)
                }
                if (multiAppVCDelegate.altOnesCalcHunsCarry == 0 )
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Hundreds carry
        case 102:
            if (sender.tag == multiAppVCDelegate.altOnesCalcHunsCarry) {
                if (multiAppVCDelegate.equationSecondNum > 100)
                {
                    
                    multiAppVCDelegate.hundredsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altOnesCalcHunsCarry)
                 } else {
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d",multiAppVCDelegate.altOnesCalcHunsCarry)+multiAppVCDelegate.spaceStr+String(format: "%1d",multiAppVCDelegate.calcOnes)
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Tens place
        case 103:
            if (sender.tag == multiAppVCDelegate.calcTens)
            {
                if ((multiAppVCDelegate.altOnesCalcHunsCarry > 0) && (multiAppVCDelegate.equationSecondNum < 100))
                {
                    multiAppVCDelegate.finalAnswer_LargeLbl.text = String(multiAppVCDelegate.altOnesCalcHunsCarry)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    multiAppVCDelegate.getNewProblem = 1
                    break
                } else {
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcTens)+String(format: "%1d", multiAppVCDelegate.calcOnes)
                }
                
                if ((multiAppVCDelegate.calculatedAnswer % 100) == 0)
                {
                    multiAppVCDelegate.firstResult_LargeLbl.text = "00"
                    // Forces display to show multiple zeros instead of just one!
                }
                if (multiAppVCDelegate.altOnesCalcThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Thousands carry
        case 104:
            if (sender.tag == multiAppVCDelegate.altOnesCalcThousCarry)
            {
                if (multiAppVCDelegate.equationSecondNum > 1000) {
                    multiAppVCDelegate.thousandsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altOnesCalcThousCarry)
                 } else {
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(multiAppVCDelegate.altOnesCalcThousCarry)+multiAppVCDelegate.spaceStr+String(multiAppVCDelegate.calcOnes)
                }
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // key click
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Hundreds place
        case 105:
            if (sender.tag == multiAppVCDelegate.calcHuns)
            {
                if ((multiAppVCDelegate.altOnesCalcThousCarry > 0) && (multiAppVCDelegate.equationSecondNum < 1000))
                {
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(multiAppVCDelegate.altOnesCalcThousCarry)+String(multiAppVCDelegate.calcHuns)+String(multiAppVCDelegate.calcTens)+String(multiAppVCDelegate.calcOnes)
                    multiAppVCDelegate.getNewProblem = 1
                    break
                }
                
                multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcHuns)+String(format: "%1d", multiAppVCDelegate.calcTens)+String(format: "%1d", multiAppVCDelegate.calcOnes)
                
                if (multiAppVCDelegate.altOnesCalcTenThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
                }
                
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Ten Thousands carry
        case 106:
            if (sender.tag == multiAppVCDelegate.calcTenThous) {
                multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcTenThous)+String(format: "%1d", multiAppVCDelegate.calcHuns)+String(format: "%1d", multiAppVCDelegate.calcTens)+String(format: "%1d", multiAppVCDelegate.calcOnes)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
        // Thousands place
        case 107:
            if (sender.tag == multiAppVCDelegate.calcThous)
            {
                if (multiAppVCDelegate.calcTenThous == 0)
                {  // this would be a leading '0' - not good so we supress it
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcThous)+String(format: "%1d", multiAppVCDelegate.calcHuns)+String(format: "%1d", multiAppVCDelegate.calcTens)+String(format: "%1d", multiAppVCDelegate.calcOnes)
                 } else { // print normally
                    multiAppVCDelegate.firstResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.calcTenThous)+String(format: "%1d", multiAppVCDelegate.calcThous)+String(format: "%1d", multiAppVCDelegate.calcHuns)+String(format: "%1d", multiAppVCDelegate.calcTens)+String(format: "%1d", multiAppVCDelegate.calcOnes)
                }
                // clean up regroup marks for next pass (tens)
                multiAppVCDelegate.onesCarry_LargeLbl.text = ""
                multiAppVCDelegate.tensCarry_LargeLbl.text = ""
                multiAppVCDelegate.hundredsCarry_LargeLbl.text = ""
                multiAppVCDelegate.thousandsCarry_LargeLbl.text = ""
                //Insert intial '0' for second mult row
                multiAppVCDelegate.secondResult_LargeLbl.text = "0"
                // Set start phase for second pass
                if (multiAppVCDelegate.altTensCalcTensCarry > 0)
                {
                    multiAppVCDelegate.inputPhase = 107
                 } else {
                    multiAppVCDelegate.inputPhase = 108
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
        // Tens carry
        case 108:
            if (sender.tag ==  multiAppVCDelegate.altTensCalcTensCarry) {
                if ( multiAppVCDelegate.equationSecondNum > 9)
                {
                    multiAppVCDelegate.tensCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altTensCalcTensCarry)
                    
                 } else {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altTensCalcTensCarry)+multiAppVCDelegate.spaceStr
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Ones place
        case 109:
            if (sender.tag == multiAppVCDelegate.altCalcOnes) {
                if ((multiAppVCDelegate.altTensCalcTensCarry > 0) && (multiAppVCDelegate.equationSecondNum < 10))
                {
                    multiAppVCDelegate.finalAnswer_LargeLbl.text = String(multiAppVCDelegate.calculatedAnswer)+"0"
                    multiAppVCDelegate.getNewProblem = 1
                    break
                } else {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                }
                if (multiAppVCDelegate.altTensCalcHunsCarry == 0 )
                {
                    multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Hundreds carry
        case 110:
            if (sender.tag == multiAppVCDelegate.altTensCalcHunsCarry) {
                if (multiAppVCDelegate.equationSecondNum > 100) {
                    multiAppVCDelegate.hundredsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altTensCalcHunsCarry)
                 } else {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altTensCalcHunsCarry)+multiAppVCDelegate.spaceStr+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                }
            } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
        // Tens place
        case 111:
            if (sender.tag == multiAppVCDelegate.altCalcTens) {
                if ((multiAppVCDelegate.altTensCalcHunsCarry > 0) && (multiAppVCDelegate.equationSecondNum < 100))
                {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(multiAppVCDelegate.altTensCalcHunsCarry)+String(multiAppVCDelegate.altCalcTens)+String(multiAppVCDelegate.altCalcOnes)+"0"
                    multiAppVCDelegate.getNewProblem = 1
                    break
                 } else {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altCalcTens)+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                }
                if (multiAppVCDelegate.altTensCalcThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
                }
            }
            else
            {
                multiAppVCDelegate.responseError = true
            }
            break
            
            
            
            
        // Thousands carry
        case 112:
            if (sender.tag == multiAppVCDelegate.altTensCalcThousCarry) {
                
                if (multiAppVCDelegate.equationSecondNum > 1000)
                {
                    multiAppVCDelegate.thousandsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altTensCalcThousCarry)
                 } else {
                    multiAppVCDelegate.secondResult_LargeLbl.text =  String(multiAppVCDelegate.altTensCalcThousCarry)+multiAppVCDelegate.spaceStr+String( multiAppVCDelegate.altCalcTens)+String(multiAppVCDelegate.altCalcOnes)+"0"
                }
                AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // key click
           } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Hundreds place
        case 113:
            if (sender.tag == multiAppVCDelegate.altCalcHuns)
            {
                if ((multiAppVCDelegate.altTensCalcThousCarry > 0) && (multiAppVCDelegate.equationSecondNum < 1000))
                {
                    multiAppVCDelegate.secondResult_LargeLbl.text = String(multiAppVCDelegate.altTensCalcThousCarry)+String(multiAppVCDelegate.altCalcHuns)+String(multiAppVCDelegate.altCalcTens)+String(multiAppVCDelegate.altCalcOnes)+"0"
                    
                    multiAppVCDelegate.getNewProblem = 1
                    break
                }
                multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altCalcHuns)+String(format: "%1d", multiAppVCDelegate.altCalcTens)+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                
                if (multiAppVCDelegate.altTensCalcTenThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Ten Thousands Carry
        case 114:
            if (sender.tag == multiAppVCDelegate.altCalcTenThous)
            {
                multiAppVCDelegate.secondResult_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altCalcTenThous)+" "+String(format: "%1d", multiAppVCDelegate.altCalcHuns)+String(format: "%1d", multiAppVCDelegate.altCalcTens)+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                if (multiAppVCDelegate.calculatedAnswer > 99999)
                {
                    multiAppVCDelegate.inputPhase = 999
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Thousands place
        case 115:
            if (sender.tag == multiAppVCDelegate.altCalcThous) {
                if (multiAppVCDelegate.altCalcTenThous == 0)
                {  // this would be a leading '0' - not good so we supress it
                    multiAppVCDelegate.secondResult_LargeLbl.text = "+ "+String(format: "%1d", multiAppVCDelegate.altCalcThous)+String(format: "%1d", multiAppVCDelegate.altCalcHuns)+String(format: "%1d", multiAppVCDelegate.altCalcTens)+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                 } else { // print normally
                    multiAppVCDelegate.secondResult_LargeLbl.text = "+ "+String(format: "%1d", multiAppVCDelegate.altCalcTenThous)+String(format: "%1d", multiAppVCDelegate.altCalcThous)+String(format: "%1d", multiAppVCDelegate.altCalcHuns)+String(format: "%1d", multiAppVCDelegate.altCalcTens)+String(format: "%1d", multiAppVCDelegate.altCalcOnes)+"0"
                }
                // Reveal summing line
                multiAppVCDelegate.sumLine_LargeLbl.isHidden = false
                multiAppVCDelegate.finalAnswerView.isHidden = false
                if ( multiAppVCDelegate.altFinCalcTensCarry == 0)
                {
                    multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Tens carry
        case 116:
            if (sender.tag == multiAppVCDelegate.altFinCalcTensCarry)
            {
                if (multiAppVCDelegate.equationSecondNum > 9)
                {
                    multiAppVCDelegate.sumTensCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altFinCalcTensCarry)
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer ones place
        case 117:
            if (sender.tag == multiAppVCDelegate.finCalcOnes)
            {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                if (multiAppVCDelegate.finalCalculatedAnswer < 10)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
                if (multiAppVCDelegate.altFinCalcHunsCarry == 0)
                {
                    multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Huns carry
        case 118:
            if (sender.tag == multiAppVCDelegate.altFinCalcHunsCarry)
            {
                multiAppVCDelegate.sumHundredsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altFinCalcHunsCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer tens place
        case 119:
            if (sender.tag == multiAppVCDelegate.finCalcTens)
            {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcTens)+String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                if (multiAppVCDelegate.finalCalculatedAnswer < 100)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
                if (multiAppVCDelegate.altFinCalcThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Thous carry
        case 120:
            if (sender.tag == multiAppVCDelegate.altFinCalcThousCarry)
            {
                multiAppVCDelegate.sumThousandsCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altFinCalcThousCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Huns place
        case 121:
            if (sender.tag == multiAppVCDelegate.finCalcHuns)
            {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcHuns)+String(format: "%1d", multiAppVCDelegate.finCalcTens)+String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                if (multiAppVCDelegate.finalCalculatedAnswer < 1000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
                if (multiAppVCDelegate.altFinCalcTenThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Ten Thous carry
        case 122:
            if (sender.tag == multiAppVCDelegate.altFinCalcTenThousCarry)
            {
                multiAppVCDelegate.sumTenThousCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altFinCalcTenThousCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Thous place
        case 123:
            if (sender.tag == multiAppVCDelegate.finCalcThous)
            {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcThous)+String(format: "%1d", multiAppVCDelegate.finCalcHuns)+String(format: "%1d", multiAppVCDelegate.finCalcTens)+String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                if (multiAppVCDelegate.finalCalculatedAnswer < 10000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
                if (multiAppVCDelegate.altFinCalcHunThousCarry == 0)
                {
                    multiAppVCDelegate.inputPhase=multiAppVCDelegate.inputPhase+1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Hun Thous carry
        case 124:
            if (sender.tag == multiAppVCDelegate.altFinCalcHunThousCarry)
            {
                multiAppVCDelegate.sumHunThousCarry_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.altFinCalcHunThousCarry)
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Ten Thous place
        case 125:
            if (sender.tag == multiAppVCDelegate.finCalcTenThous) {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcTenThous)+String(format: "%1d", multiAppVCDelegate.finCalcThous)+String(format: "%1d", multiAppVCDelegate.finCalcHuns)+String(format: "%1d", multiAppVCDelegate.finCalcTens)+String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                if (multiAppVCDelegate.finalCalculatedAnswer < 100000)
                {
                    multiAppVCDelegate.getNewProblem = 1
                }
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        // Final answer Hun Thous place
        case 126:
            if (sender.tag ==  multiAppVCDelegate.finCalcHunThous) {
                multiAppVCDelegate.finalAnswer_LargeLbl.text = String(format: "%1d", multiAppVCDelegate.finCalcHunThous)+String(format: "%1d", multiAppVCDelegate.finCalcTenThous)+String(format: "%1d", multiAppVCDelegate.finCalcThous)+String(format: "%1d", multiAppVCDelegate.finCalcHuns)+String(format: "%1d", multiAppVCDelegate.finCalcTens)+String(format: "%1d", multiAppVCDelegate.finCalcOnes)
                
                multiAppVCDelegate.getNewProblem = 1
                
             } else {
                multiAppVCDelegate.responseError = true
            }
            break
            
        default:
            multiAppVCDelegate.responseError = true
            break
        }
        
        multiAppVCDelegate.regroupSlashesLbl.text = multiAppVCDelegate.slashThousStr+" "+multiAppVCDelegate.slashHunsStr+" "+multiAppVCDelegate.slashTensStr+" "+multiAppVCDelegate.slashOnesStr
        
        if (multiAppVCDelegate.responseError)
        {
            AppdelegateRef.appDelegate.setScore(inScore: 2)  //Bump up score (up is bad)
            AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.soundFileObject) //Quack
            multiAppVCDelegate.ErrorOnThisQuestion = true
            multiAppVCDelegate.responseError = false
        } else if (Bool(multiAppVCDelegate.getNewProblem as NSNumber) == true) {
            
            // Set the time it took to answer this question
            AppdelegateRef.appDelegate.setTime(inTime: multiAppVCDelegate.elapsedSeconds) // Timer get reset to '0' in the GetNexFact method
            multiAppVCDelegate.isRandom = true
            AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.dingsoundFileObject) // Ding sound
            if (multiAppVCDelegate.ErrorOnThisQuestion == false && Bool(multiAppVCDelegate.getNewProblem as NSNumber) == true && (multiAppVCDelegate.questionCount > 4))
            {
                multiAppVCDelegate.animationView.isHidden = false
                multiAppVCDelegate.animationImage.image = UIImage.gifImageWithData(multiAppVCDelegate.gifImagesArray[multiAppVCDelegate.selectedGifIndex])
                if multiAppVCDelegate.selectedGifIndex==2
                {
                    multiAppVCDelegate.selectedGifIndex=0
                 } else {
                    multiAppVCDelegate.selectedGifIndex = multiAppVCDelegate.selectedGifIndex+1
                }
                 multiAppVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 8.1, target: multiAppVCDelegate, selector:#selector(multiAppVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
                multiAppVCDelegate.questionCount = 0
             } else {
                 multiAppVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval:2.5, target: multiAppVCDelegate, selector:#selector(multiAppVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
            }
            multiAppVCDelegate.questionCount = multiAppVCDelegate.questionCount+1
            multiAppVCDelegate.getNewProblem = 0
         } else {
            AudioServicesPlaySystemSound (AudioFilesConstant.kSoundFileObject.clicksoundFileObject) // key click
            multiAppVCDelegate.inputPhase = multiAppVCDelegate.inputPhase+1
        }
        let firstResultattributedString = NSMutableAttributedString(string: multiAppVCDelegate.firstResult_LargeLbl.text!)
        firstResultattributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.0), range: NSRange(location: 0, length: firstResultattributedString.length))
        multiAppVCDelegate.firstResult_LargeLbl.attributedText = firstResultattributedString
        
        let secondResultattributedString = NSMutableAttributedString(string: multiAppVCDelegate.secondResult_LargeLbl.text!)
        secondResultattributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.0), range: NSRange(location: 0, length: secondResultattributedString.length))
        multiAppVCDelegate.secondResult_LargeLbl.attributedText = secondResultattributedString
        
        let finalResultattributedString = NSMutableAttributedString(string: multiAppVCDelegate.finalAnswer_LargeLbl.text!)
        finalResultattributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.0), range: NSRange(location: 0, length: finalResultattributedString.length))
        multiAppVCDelegate.finalAnswer_LargeLbl.attributedText = finalResultattributedString
    }
    //Updating the frames for the iPhone 4 device
    func viewWillLayoutSubviews()
    {
        if DeviceModel.IS_IPHONE_4_OR_LESS
        {
            multiAppVCDelegate.firstView.frame = CGRect(x: multiAppVCDelegate.firstView.frame.origin.x, y: multiAppVCDelegate.firstView.frame.origin.y, width: multiAppVCDelegate.firstView.frame.size.width, height:69)
            multiAppVCDelegate.secondView.frame = CGRect(x: multiAppVCDelegate.secondView.frame.origin.x, y: multiAppVCDelegate.secondView.frame.origin.y, width: multiAppVCDelegate.secondView.frame.size.width, height:69)
            multiAppVCDelegate.thirdView.frame = CGRect(x: multiAppVCDelegate.thirdView.frame.origin.x, y: multiAppVCDelegate.thirdView.frame.origin.y, width: multiAppVCDelegate.thirdView.frame.size.width, height:69)
            multiAppVCDelegate.fourthView.frame = CGRect(x: multiAppVCDelegate.fourthView.frame.origin.x, y: multiAppVCDelegate.fourthView.frame.origin.y, width: multiAppVCDelegate.fourthView.frame.size.width, height:69)
            
            multiAppVCDelegate.responseCarryView.frame = CGRect(x: multiAppVCDelegate.responseCarryView.frame.origin.x+1, y: multiAppVCDelegate.responseCarryView.frame.origin.y, width: multiAppVCDelegate.responseCarryView.frame.size.width, height:multiAppVCDelegate.responseCarryView.frame.size.height)
            
            multiAppVCDelegate.popUpTitleView.frame = CGRect(x: 0, y: 0, width: DeviceModel.SCREEN_WIDTH, height: 40)
            
            multiAppVCDelegate.popUpmessageView.frame = CGRect(x: 0, y: 40, width: DeviceModel.SCREEN_WIDTH, height: 350)
            
        }
    }
    
   // Custom method to get the random numbers by using the level which was user selected.
     func getNewNumbers()
      {
        if(multiAppVCDelegate.isRandom == true)
        {
        multiAppVCDelegate.isRandom = false
        multiAppVCDelegate.animationView.isHidden = true
        multiAppVCDelegate.sumOnesCarry_LargeLbl.isHidden = false
        multiAppVCDelegate.onesCarryLbl.isHidden = false
        multiAppVCDelegate.tensCarryLbl.isHidden = false
        multiAppVCDelegate.hundredsCarryLbl.isHidden = false
        multiAppVCDelegate.thousandsCarryLbl.isHidden = false
        multiAppVCDelegate.answer1Lbl.isHidden = false
        multiAppVCDelegate.regroupSlashesLbl.isHidden = false
        multiAppVCDelegate.answer1View.isHidden = false
        multiAppVCDelegate.firstNumber_SmallLbl.isHidden = false
        multiAppVCDelegate.secondNumber_SmallLbl.isHidden = false
        multiAppVCDelegate.equationLineLbl.isHidden = false
            //ajay commented
        //multiAppVCDelegate.questionCount = multiAppVCDelegate.questionCount+1
        multiAppVCDelegate.ErrorOnThisQuestion = false
        multiAppVCDelegate.firstNumber_LargeLbl.isHidden = true
        multiAppVCDelegate.secondNumber_LargeLbl.isHidden = true
        multiAppVCDelegate.onesCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.tensCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.hundredsCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.thousandsCarry_LargeLbl.isHidden = true

            multiAppVCDelegate.sumOnesCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.sumTensCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.sumHundredsCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.sumThousandsCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.sumTenThousCarry_LargeLbl.isHidden = true
        multiAppVCDelegate.sumHunThousCarry_LargeLbl.isHidden = true
        
        multiAppVCDelegate.regroupSlashes_LargeLbl.isHidden = true
        multiAppVCDelegate.firstResult_LargeLbl.isHidden = true
        multiAppVCDelegate.secondResult_LargeLbl.isHidden = true
        multiAppVCDelegate.finalAnswer_LargeLbl.isHidden = true
        multiAppVCDelegate.finalAnswerView.isHidden = true
        multiAppVCDelegate.sumLine_LargeLbl.isHidden = true
        multiAppVCDelegate.equationLine_LargeLbl.isHidden = true
            multiAppVCDelegate.equationLine_LargeLbl.backgroundColor = UIColor.clear
            multiAppVCDelegate.finalAnswer_LargeLbl.backgroundColor = UIColor.clear
        
        var firstNum:Int = 0
        var secondNum:Int = 0
        var indexToRndArray:Int = 1
        
        multiAppVCDelegate.TensCarryAlreadySet = false
        multiAppVCDelegate.elapsedSeconds = 0     // Reset elapsed timer
        
        //Define appDelegate objext so we can access common variables
        
        switch (multiAppVCDelegate.mfLevel)
        {
        case 0:
            repeat {
                
                indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
                multiAppVCDelegate.equationSecondNum = AppdelegateRef.appDelegate.RandomNumSecondVal
                multiAppVCDelegate.equationFirstNum = AppdelegateRef.appDelegate.RandomNumFirstVal
                
                
            } while ((multiAppVCDelegate.equationFirstNum + multiAppVCDelegate.equationSecondNum) > 9)
            firstNum =  multiAppVCDelegate.equationFirstNum  ///////////////////////////////////////////////////   <<<<  KLUDGE
            secondNum = multiAppVCDelegate.equationSecondNum ///////////////////////////////////////////////////   <<<<  KLUDGE
            break
            
        case 1:
            
            indexToRndArray = AppdelegateRef.appDelegate.RandomNumInRange
            multiAppVCDelegate.equationSecondNum = AppdelegateRef.appDelegate.RandomNumSecondVal
            multiAppVCDelegate.equationFirstNum = AppdelegateRef.appDelegate.RandomNumFirstVal
            
            firstNum =  multiAppVCDelegate.equationFirstNum  ///////////////////////////////////////////////////   <<<<  KLUDGE
            secondNum = multiAppVCDelegate.equationSecondNum ///////////////////////////////////////////////////   <<<<  KLUDGE
            break
            
        case 2:
            // Force first num to be 2 digits
            firstNum = Int(((arc4random_uniform(9) + 1) * 10) + (arc4random_uniform(10)))
            
            // Force second num to be 3 digits (so not randomly smaller then first number !
            secondNum = Int(((arc4random_uniform(9) + 1) * 100) + (arc4random_uniform(100)))
            break
        case 3:
            // Force first num to be 2 digits
            ///            firstNum   = (arc4random() % 10)
            firstNum = Int(((arc4random_uniform(9) + 1) * 10) + arc4random_uniform(10))
            
            ///            secondNum = (arc4random() % 1000)
            // Force second num to be 4 digits (so not randomly smaller then first number !
            secondNum = Int(((arc4random_uniform(9) + 1) * 1000) + (arc4random_uniform(1000)))
            break
        default:
            break
        }
        // Check array index for absurdly large value
        if (indexToRndArray > 1000) {
            print("Index Out of Bounds")
        }
        
        // Ensures larger number is on top
        if (multiAppVCDelegate.equationFirstNum > multiAppVCDelegate.equationSecondNum) {  // then reverse the order
            multiAppVCDelegate.equationSecondNum = AppdelegateRef.appDelegate.RandomNumFirstVal
            multiAppVCDelegate.equationFirstNum = AppdelegateRef.appDelegate.RandomNumSecondVal
        }
        multiAppVCDelegate.equationFirstNum  = firstNum
        multiAppVCDelegate.equationSecondNum = secondNum
//            multiAppVCDelegate.equationFirstNum  = 77
//            multiAppVCDelegate.equationSecondNum = 1953

        
        //NSString* mathOpp
        switch (multiAppVCDelegate.mfCategory) {   // Math Opperation
        case 0: // Addition
            multiAppVCDelegate.mathOppStr = "+"
            multiAppVCDelegate.calculatedAnswer = multiAppVCDelegate.equationFirstNum + multiAppVCDelegate.equationSecondNum
            multiAppVCDelegate.calcTensCarry  = ((multiAppVCDelegate.equationFirstNum % 10) + (multiAppVCDelegate.equationSecondNum % 10)) / 10
            multiAppVCDelegate.calcHunsCarry  = ((multiAppVCDelegate.equationFirstNum % 100) + (multiAppVCDelegate.equationSecondNum % 100)) / 100
            multiAppVCDelegate.calcThousCarry = ((multiAppVCDelegate.equationFirstNum % 1000) + (multiAppVCDelegate.equationSecondNum % 1000)) / 1000
            
            multiAppVCDelegate.calcTenThous = ((multiAppVCDelegate.equationFirstNum % 10000) + (multiAppVCDelegate.equationSecondNum % 10000)) / 10000
            
            // Set initial input phase based on the randomly generated equation
            if (multiAppVCDelegate.calcTensCarry > 0)
            {
                multiAppVCDelegate.inputPhase = 0
            } else {
                multiAppVCDelegate.inputPhase = 1
            }
            break
            
        case 1: // Subtraction
            multiAppVCDelegate.mathOppStr = "-"
            
            //            // Second number needs to be bigger than the first number
            //            if (mfLevel == 0) equationSecondNum = (arc4random() % (10 - firstNum) + firstNum)
            
            // For Level 1, Force two digits, but don't want to regroup so 1's place digit needs to be smaller than fist number
            //                                                    (Ones place smaller than 1st + (Tens place not = zero.
            
            if (multiAppVCDelegate.mfLevel == 1)
            {
                multiAppVCDelegate.equationSecondNum = (10 * Int((arc4random_uniform(9)) + 1))+multiAppVCDelegate.equationSecondNum
            }
                // Precalculate discrete values
            multiAppVCDelegate.calculatedAnswer = multiAppVCDelegate.equationSecondNum - multiAppVCDelegate.equationFirstNum
            
            multiAppVCDelegate.equationOnes =  multiAppVCDelegate.equationSecondNum % 10
            multiAppVCDelegate.equationTens = (multiAppVCDelegate.equationSecondNum % 100)   / 10
            multiAppVCDelegate.equationHuns = (multiAppVCDelegate.equationSecondNum % 1000)  / 100
            multiAppVCDelegate.equationThous = (multiAppVCDelegate.equationSecondNum % 10000) / 1000
            
            multiAppVCDelegate.firstNumOnes =  multiAppVCDelegate.equationFirstNum % 10
            multiAppVCDelegate.firstNumTens = (multiAppVCDelegate.equationFirstNum % 100)   / 10
            multiAppVCDelegate.firstNumHuns = (multiAppVCDelegate.equationFirstNum % 1000)  / 100
            multiAppVCDelegate.firstNumThous = (multiAppVCDelegate.equationFirstNum % 10000) / 1000
            
            multiAppVCDelegate.calcOnesCarry = -1
            multiAppVCDelegate.calcTensCarry = -1
            multiAppVCDelegate.calcHunsCarry = -1
            multiAppVCDelegate.calcThousCarry = -1
            
            multiAppVCDelegate.inputPhase = 10 // Switch structure (state machine) entry point for subtraction
            break
            
        case 2: //Multiplication
            multiAppVCDelegate.mathOppStr = "×"
            if (multiAppVCDelegate.mfLevel == 0)
            {
                repeat
                {
                    multiAppVCDelegate.equationSecondNum = Int(arc4random_uniform(9) + 1)
                }
                    while (multiAppVCDelegate.equationSecondNum * multiAppVCDelegate.equationFirstNum > 10)
            }
            
            
            if (multiAppVCDelegate.mfLevel == 2) {
                // Force first num to be 1 digits
                multiAppVCDelegate.equationFirstNum   = (Int(arc4random_uniform(10)))
            }
            
            // Seperate multipler into its ones and tens component
            if (multiAppVCDelegate.equationFirstNum > 9)
            {
                multiAppVCDelegate.equationMultiplierOnes = multiAppVCDelegate.equationFirstNum % 10
                multiAppVCDelegate.equationMultiplierTens = multiAppVCDelegate.equationFirstNum / 10
             } else {
                multiAppVCDelegate.equationMultiplierOnes = multiAppVCDelegate.equationFirstNum
            }
            multiAppVCDelegate.calculatedAnswer = multiAppVCDelegate.equationFirstNum * multiAppVCDelegate.equationSecondNum
            multiAppVCDelegate.calcTensCarry  = ((multiAppVCDelegate.equationFirstNum % 10) * (multiAppVCDelegate.equationSecondNum % 10)) / 10
            multiAppVCDelegate.calcHunsCarry  = ((multiAppVCDelegate.equationFirstNum % 100) * (multiAppVCDelegate.equationSecondNum % 100)) / 100
            multiAppVCDelegate.calcThousCarry = ((multiAppVCDelegate.equationFirstNum % 1000) * (multiAppVCDelegate.equationSecondNum % 1000)) / 1000
            // Set initial input phase based on the size of the randomly generated equation
            if (multiAppVCDelegate.calcTensCarry > 0)
            {
                multiAppVCDelegate.inputPhase = 0
                
             } else {
                multiAppVCDelegate.inputPhase = 1
            }
            
            
            if (multiAppVCDelegate.mfLevel == 3)
            {
                
                multiAppVCDelegate.pageControl.frame = CGRect(x:  multiAppVCDelegate.pageControl.frame.origin.x, y: multiAppVCDelegate.applyFactsLbl.frame.origin.y+multiAppVCDelegate.applyFactsLbl.frame.size.height+5, width: multiAppVCDelegate.pageControl.frame.size.width, height: 5)
                
                
                
                multiAppVCDelegate.onesCarryLbl.isHidden = true
                multiAppVCDelegate.tensCarryLbl.isHidden = true
                multiAppVCDelegate.hundredsCarryLbl.isHidden = true
                multiAppVCDelegate.thousandsCarryLbl.isHidden = true
                multiAppVCDelegate.answer1Lbl.isHidden = true
                multiAppVCDelegate.regroupSlashesLbl.isHidden = true
                multiAppVCDelegate.answer1View.isHidden = true
                multiAppVCDelegate.firstNumber_SmallLbl.isHidden = true
                multiAppVCDelegate.secondNumber_SmallLbl.isHidden = true
                multiAppVCDelegate.equationLineLbl.isHidden = true
                
                multiAppVCDelegate.firstNumber_LargeLbl.isHidden = false
                multiAppVCDelegate.secondNumber_LargeLbl.isHidden = false
                multiAppVCDelegate.onesCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.tensCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.hundredsCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.thousandsCarry_LargeLbl.isHidden = false
                
                multiAppVCDelegate.sumOnesCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.sumTensCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.sumHundredsCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.sumThousandsCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.sumTenThousCarry_LargeLbl.isHidden = false
                multiAppVCDelegate.sumHunThousCarry_LargeLbl.isHidden = false
                
                multiAppVCDelegate.regroupSlashes_LargeLbl.isHidden = false
                multiAppVCDelegate.firstResult_LargeLbl.isHidden = false
                multiAppVCDelegate.secondResult_LargeLbl.isHidden = false
                multiAppVCDelegate.finalAnswer_LargeLbl.isHidden = false
                //multiAppVCDelegate.finalAnswerView.isHidden = false
            
                
                multiAppVCDelegate.equationLine_LargeLbl.isHidden = false
                
                
                multiAppVCDelegate.calculatedAnswer = multiAppVCDelegate.equationMultiplierOnes * multiAppVCDelegate.equationSecondNum
                
                multiAppVCDelegate.altOnesCalcTensCarry  = ((multiAppVCDelegate.equationMultiplierOnes % 10) * (multiAppVCDelegate.equationSecondNum % 10)) / 10
                
                multiAppVCDelegate.altOnesCalcHunsCarry  = ((multiAppVCDelegate.equationMultiplierOnes % 100) * (multiAppVCDelegate.equationSecondNum % 100)) / 100
                
                multiAppVCDelegate.altOnesCalcThousCarry = ((multiAppVCDelegate.equationMultiplierOnes % 1000) * (multiAppVCDelegate.equationSecondNum % 1000)) / 1000
                
                multiAppVCDelegate.altOnesCalcTenThousCarry = ((multiAppVCDelegate.equationMultiplierOnes % 10000) * (multiAppVCDelegate.equationSecondNum % 10000)) / 10000
                
                multiAppVCDelegate.altTensCalculatedAnswer = multiAppVCDelegate.equationMultiplierTens * multiAppVCDelegate.equationSecondNum
                
                multiAppVCDelegate.altTensCalcTensCarry  = ((multiAppVCDelegate.equationMultiplierTens % 10) * (multiAppVCDelegate.equationSecondNum % 10)) / 10
                
                multiAppVCDelegate.altTensCalcHunsCarry  = ((multiAppVCDelegate.equationMultiplierTens % 100) * (multiAppVCDelegate.equationSecondNum % 100)) / 100
                
                multiAppVCDelegate.altTensCalcThousCarry = ((multiAppVCDelegate.equationMultiplierTens % 1000) * (multiAppVCDelegate.equationSecondNum % 1000)) / 1000
                
                multiAppVCDelegate.altTensCalcTenThousCarry = ((multiAppVCDelegate.equationMultiplierTens % 10000) * (multiAppVCDelegate.equationSecondNum % 10000)) / 10000
                
                
                multiAppVCDelegate.finalCalculatedAnswer = multiAppVCDelegate.equationFirstNum * multiAppVCDelegate.equationSecondNum
                
                multiAppVCDelegate.altFinCalcTensCarry  = ((multiAppVCDelegate.calculatedAnswer % 10) + ((multiAppVCDelegate.altTensCalculatedAnswer * 10) % 10)) / 10
                
                multiAppVCDelegate.altFinCalcHunsCarry  = ((multiAppVCDelegate.calculatedAnswer % 100) + ((multiAppVCDelegate.altTensCalculatedAnswer * 10) % 100)) / 100
                
                multiAppVCDelegate.altFinCalcThousCarry = ((multiAppVCDelegate.calculatedAnswer % 1000) + ((multiAppVCDelegate.altTensCalculatedAnswer * 10) % 1000)) / 1000
                
                multiAppVCDelegate.altFinCalcTenThousCarry = ((multiAppVCDelegate.calculatedAnswer % 10000) + ((multiAppVCDelegate.altTensCalculatedAnswer * 10) % 10000)) / 10000
                
                multiAppVCDelegate.altFinCalcHunThousCarry = ((multiAppVCDelegate.calculatedAnswer % 100000) + ((multiAppVCDelegate.altTensCalculatedAnswer * 10) % 100000)) / 100000
                
                
                // Set initial input phase based on the randomly generated equation
                if (multiAppVCDelegate.altOnesCalcTensCarry > 0){
                    multiAppVCDelegate.inputPhase = 100
                 } else {
                    multiAppVCDelegate.inputPhase = 101
                }
            }
            
            break
        case 3: // Division
            // Division is handled in it's own view
            break
        default:
            break
        }
        
        // Bottom of equation
            let countStr =  NSMutableAttributedString(string: multiAppVCDelegate.mathOppStr,attributes: [NSFontAttributeName:UIFont(name: "SFNS Display", size: 40.0)!])
            countStr.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 13.0/255.0, green: 44.0/255.0, blue: 66.0/255.0, alpha: 1.0), range: NSRange(location:0,length:(multiAppVCDelegate.mathOppStr.characters.count)))
            
            //let str = NSMutableAttributedString()
            countStr.append(NSMutableAttributedString(string: "  "))
            countStr.append(NSMutableAttributedString(string: String(multiAppVCDelegate.equationFirstNum)))
            
            /*if String(multiAppVCDelegate.equationFirstNum).characters.count == 1
            {
                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center
                
                countStr.addAttributes([NSParagraphStyleAttributeName: paragraph], range: NSMakeRange(0, countStr.length))
            }*/
            multiAppVCDelegate.firstNumber_SmallLbl.attributedText = countStr
            
      //  multiAppVCDelegate.multiplierLbl.text = multiAppVCDelegate.mathOpp+"  "+String(multiAppVCDelegate.equationFirstNum)
        
        multiAppVCDelegate.firstNumber_LargeLbl.text = multiAppVCDelegate.mathOppStr+" "+String(multiAppVCDelegate.equationFirstNum)
        
        // Top of equation
            
            
            
            /*if String(multiAppVCDelegate.equationSecondNum).characters.count == 1
            {
                multiAppVCDelegate.secondNumber_SmallLbl.textAlignment = .center
                 multiAppVCDelegate.secondNumber_SmallLbl.text = "     "+String(multiAppVCDelegate.equationSecondNum)
            }
            else{*/
                
                 multiAppVCDelegate.secondNumber_SmallLbl.text = String(multiAppVCDelegate.equationSecondNum)
           // }
       
        
        multiAppVCDelegate.secondNumber_LargeLbl.text = String(multiAppVCDelegate.equationSecondNum)
        
        
        // Calculate response digits
        multiAppVCDelegate.calcOnes     = multiAppVCDelegate.calculatedAnswer % 10
        multiAppVCDelegate.calcTens     = (multiAppVCDelegate.calculatedAnswer / 10) % 10
        multiAppVCDelegate.calcHuns     = (multiAppVCDelegate.calculatedAnswer / 100) % 10
        multiAppVCDelegate.calcThous    = (multiAppVCDelegate.calculatedAnswer / 1000) % 10
        multiAppVCDelegate.calcTenThous = (multiAppVCDelegate.calculatedAnswer / 10000) % 10
        
        // Calculate alt response digits
        multiAppVCDelegate.altCalcOnes     = multiAppVCDelegate.altTensCalculatedAnswer % 10
        multiAppVCDelegate.altCalcTens     = (multiAppVCDelegate.altTensCalculatedAnswer / 10) % 10
        multiAppVCDelegate.altCalcHuns     = (multiAppVCDelegate.altTensCalculatedAnswer / 100) % 10
        multiAppVCDelegate.altCalcThous    = (multiAppVCDelegate.altTensCalculatedAnswer / 1000) % 10
        multiAppVCDelegate.altCalcTenThous = (multiAppVCDelegate.altTensCalculatedAnswer / 10000) % 10
        
        // Calculate final summation digits
        multiAppVCDelegate.finCalcOnes     = multiAppVCDelegate.finalCalculatedAnswer % 10
        multiAppVCDelegate.finCalcTens     = (multiAppVCDelegate.finalCalculatedAnswer / 10) % 10
        multiAppVCDelegate.finCalcHuns     = (multiAppVCDelegate.finalCalculatedAnswer / 100) % 10
        multiAppVCDelegate.finCalcThous    = (multiAppVCDelegate.finalCalculatedAnswer / 1000) % 10
        multiAppVCDelegate.finCalcTenThous = (multiAppVCDelegate.finalCalculatedAnswer / 10000) % 10
        multiAppVCDelegate.finCalcHunThous = (multiAppVCDelegate.finalCalculatedAnswer / 100000) % 10
        
        // Clear old values
        multiAppVCDelegate.onesCarryLbl.text =  ""
        multiAppVCDelegate.tensCarryLbl.text =  ""
        multiAppVCDelegate.hundredsCarryLbl.text =  ""
        multiAppVCDelegate.thousandsCarryLbl.text = ""
        multiAppVCDelegate.answer1Lbl.text =  ""
        multiAppVCDelegate.regroupSlashesLbl.text = ""
        
        multiAppVCDelegate.onesCarry_LargeLbl.text =  ""
        multiAppVCDelegate.tensCarry_LargeLbl.text =  ""
        multiAppVCDelegate.hundredsCarry_LargeLbl.text =  ""
        multiAppVCDelegate.thousandsCarry_LargeLbl.text = ""
        
        multiAppVCDelegate.sumOnesCarry_LargeLbl.text  =  ""
        multiAppVCDelegate.sumTensCarry_LargeLbl.text  =  ""
        multiAppVCDelegate.sumHundredsCarry_LargeLbl.text  =  ""
        multiAppVCDelegate.sumThousandsCarry_LargeLbl.text =  ""
        multiAppVCDelegate.sumTenThousCarry_LargeLbl.text =  ""
        multiAppVCDelegate.sumHunThousCarry_LargeLbl.text =  ""
        
        multiAppVCDelegate.finalAnswer_LargeLbl.text =  ""
        multiAppVCDelegate.firstResult_LargeLbl.text =  ""
        multiAppVCDelegate.secondResult_LargeLbl.text =  ""
        multiAppVCDelegate.regroupSlashes_LargeLbl.text = ""
        
        // Clear regroup slashes
        multiAppVCDelegate.slashOnesStr  = " "
        multiAppVCDelegate.slashTensStr  = " "
        multiAppVCDelegate.slashHunsStr  = " "
        multiAppVCDelegate.slashThousStr = " "
            
        }
    }
    
    
    // MARK:- Custom button actions
    
    // Custom method to show information about the functionalty of the view controller in an alert.
    func showApplicationInfo()
    {
      
        multiAppVCDelegate.alertPopOverView.isHidden = false
    }
    
    // Custom method to present the menu view controller to select the range, category and the level.
    func showMenuView()
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMenuVC) as! MenuViewController
        
        multiAppVCDelegate.present(nextVC, animated: true, completion: nil)
 
    }
    
    //MARK:- Custom Methods for Swipe
    
    // Custom method to present `Speed Drill ViewController` when user swipes to left side.
    func handleSwipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers
            .kSpeedDrilVC) as! MultiSpeedDrillViewController
        
        nextVC.modalTransitionStyle = .flipHorizontal
         AppdelegateRef.appDelegate.islaunch = false
        multiAppVCDelegate.present(nextVC, animated: true, completion: nil)
        
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        
        multiAppVCDelegate.isRandom = true
        
    }
    
    // Custom method to present `Mathfacts ViewController` when user swipes to right side.
    func handleSwipeRight(recognizer:UISwipeGestureRecognizer)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers
            .kMathFactsVC) as! MathFactsViewController
        
        nextVC.modalTransitionStyle = .flipHorizontal
         AppdelegateRef.appDelegate.islaunch = false
        multiAppVCDelegate.present(nextVC, animated: true, completion: nil)
        
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        multiAppVCDelegate.isRandom = true
    }
    
    // Custom method to present `LongDivision ViewController` if the category is 3 when user swipes to up side or it will present the new numbers.
    func handleSwipeUp(recognizer:UISwipeGestureRecognizer)
    {
        multiAppVCDelegate.mfCategory = multiAppVCDelegate.mfCategory+1
        if (multiAppVCDelegate.mfCategory > 3)
        {  // // Wrap through Add > Sub > Mult > Div > and around to Add...
            multiAppVCDelegate.mfCategory = 0;
        }
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: multiAppVCDelegate.mfCategory)
        self.flashIcon() /// to flash up the new math operator sign briefly
        if (multiAppVCDelegate.mfCategory == 3)
        {
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kLongDivisionVC) as! LongDivisionViewController
            nextVC.questionCount = multiAppVCDelegate.questionCount
            nextVC.selectedGifIndex = multiAppVCDelegate.selectedGifIndex
            nextVC.modalTransitionStyle = .crossDissolve
            
            multiAppVCDelegate.present(nextVC, animated: true, completion: nil)
            
         } else {
            //  Start timer to get new numbers
            multiAppVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: multiAppVCDelegate, selector: #selector(multiAppVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
        }
        multiAppVCDelegate.isRandom = true
    }
    
    // Custom method to present `LongDivision ViewController` if the category is 3 when user swipes to down side or it will present the new numbers.
    func handleSwipeDown(recognizer:UISwipeGestureRecognizer)
    {
        multiAppVCDelegate.mfCategory = multiAppVCDelegate.mfCategory-1;
        if (multiAppVCDelegate.mfCategory < 0)
        {  // Wrap through Add > Sub > Mult > Div > and around to Add...
            multiAppVCDelegate.mfCategory = 3;
        }
        AppdelegateRef.appDelegate.setMathFactsCatagory(newCatagory: multiAppVCDelegate.mfCategory)
        self.flashIcon()
        if (multiAppVCDelegate.mfCategory == 3)
        {
            let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kLongDivisionVC) as! LongDivisionViewController
            nextVC.questionCount = multiAppVCDelegate.questionCount
            nextVC.selectedGifIndex = multiAppVCDelegate.selectedGifIndex
            nextVC.modalTransitionStyle = .crossDissolve
            
            multiAppVCDelegate.present(nextVC, animated: true, completion: nil)
            
         } else {
            
            //  Start timer to get new numbers
            multiAppVCDelegate.timeForNewNumbers = Timer.scheduledTimer(timeInterval: 0.5, target: multiAppVCDelegate, selector: #selector(multiAppVCDelegate.getNewNumbers), userInfo: nil, repeats: false)
        }
        multiAppVCDelegate.isRandom = true
    }
   // This function is called whe home button is clicked
    func homeButtonAction(sender: UIButton)
    {
        let nextVC = StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers
            .kMathFactsVC) as! MathFactsViewController
        AppdelegateRef.appDelegate.islaunch = true
    multiAppVCDelegate.present(nextVC, animated: false, completion: nil)
        
        AudioServicesPlaySystemSound(AudioFilesConstant.kSoundFileObject.wooshsoundFileObject)
        multiAppVCDelegate.isRandom = true

    }

}
