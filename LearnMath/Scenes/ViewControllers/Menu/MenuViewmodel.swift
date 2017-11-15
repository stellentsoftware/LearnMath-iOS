//
//  MenuViewmodel.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 13/05/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import Foundation
import UIKit

class MenuViewModel{
    
    var menuVCDelegate:MenuViewController!
  
    
    //MARK:- Custom Methods
    
    func initialLoading()
    {
        if DeviceModel.IS_IPHONE_4_OR_LESS{
            
            menuVCDelegate.levelOneBtn.frame.size.height = menuVCDelegate.levelOneBtn.frame.size.width
            menuVCDelegate.levelTwoBtn.frame.size.height = menuVCDelegate.levelTwoBtn.frame.size.width
            menuVCDelegate.levelThreeBtn.frame.size.height = menuVCDelegate.levelThreeBtn.frame.size.width
            menuVCDelegate.levelFourBtn.frame.size.height = menuVCDelegate.levelFourBtn.frame.size.width
            ////////////////////
            menuVCDelegate.categoryPlusBtn.frame.size.height = menuVCDelegate.categoryPlusBtn.frame.size.width
            menuVCDelegate.categoryMinusBtn.frame.size.height = menuVCDelegate.categoryMinusBtn.frame.size.width
            menuVCDelegate.categoryMultiplyBtn.frame.size.height = menuVCDelegate.categoryMultiplyBtn.frame.size.width
            menuVCDelegate.categoryDivisionBtn.frame.size.height = menuVCDelegate.categoryDivisionBtn.frame.size.width
            
            menuVCDelegate.closeBtn.frame.size.height = menuVCDelegate.closeBtn.frame.size.width
        }
       menuVCDelegate.questionsSlider.isHighlighted = false
        menuVCDelegate.timerSlider.isHighlighted = false

        menuVCDelegate.questionsSlider.setThumbImage(#imageLiteral(resourceName: "Pause"), for:.normal)
        menuVCDelegate.timerSlider.setThumbImage(#imageLiteral(resourceName: "Pause"), for: .normal)
        menuVCDelegate.questionsSlider.setThumbImage(#imageLiteral(resourceName: "Pause"), for:.highlighted)
        menuVCDelegate.timerSlider.setThumbImage(#imageLiteral(resourceName: "Pause"), for: .highlighted)
      
        if (menuVCDelegate.defaults.string(forKey: "sound") == "Off")
        {
           menuVCDelegate.soundSwitch.isOn = false
         } else {
            menuVCDelegate.soundSwitch.isOn = true
        }
    }
    // Custom Method to apply the swipe gestures to the view controller view.
    func addingGestures()
    {
        // Swipe Left
        let swipeLeft = UISwipeGestureRecognizer(target: menuVCDelegate, action: #selector(menuVCDelegate.handleSwipeLeft))
        
        swipeLeft.direction = .left
        menuVCDelegate.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        let swipeRight = UISwipeGestureRecognizer(target: menuVCDelegate, action: #selector(menuVCDelegate.handleSwipeRight))
        swipeRight.direction = .right
        menuVCDelegate.view.addGestureRecognizer(swipeRight)
    }
        // Custom method to save the data related to the diffuculty leve, range of numbers, operation category, speed drill time and the questions number range into the `data.plist`
    func dataSavingToPlist()
    {
        // Setup path to saved data from data.plist - Cann't this be combined with View Did Load code??????
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDirectory = paths[0]
        let path = documentsDirectory.appending("/data.plist")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: path){
            
            let bundle = Bundle.main.path(forResource: "data", ofType: "plist")
            do{
                try fileManager.copyItem(atPath: bundle!, toPath: path)
            }
            catch{
            }
        }
        // Write user modified data to the data.plist file
        if let dataToSave = NSMutableDictionary(contentsOfFile: path){
            // Add new elements here
            dataToSave.setValue(menuVCDelegate.selectedLevel, forKey: "mathLevel")
            dataToSave.setValue(menuVCDelegate.selectedNumberRange, forKey: "NumSet")
            dataToSave.setValue(menuVCDelegate.selectedCategory, forKey: "Basics")
            dataToSave.setValue(menuVCDelegate.sliderTimerValue, forKey: "sliderTimer")
            dataToSave.setValue(menuVCDelegate.sliderQuestionCountValue, forKey: "sliderQuestions")
            dataToSave.write(toFile: path, atomically: true)
            print("data.plist file is \(dataToSave)")
         } else {
            print("data.plist file is empty")
        }
    }
    // Custom method to highlight the selected level button and also changing the background image for the other level buttons.
    func setLevelbtnBackgroundImage(sender:Int)
    {
        switch sender {
        case 0:
            
            menuVCDelegate.levelOneBtn.isSelected = true
            menuVCDelegate.levelTwoBtn.isSelected = false
            menuVCDelegate.levelThreeBtn.isSelected = false
            menuVCDelegate.levelFourBtn.isSelected = false
            
            break
        case 1:
            menuVCDelegate.levelOneBtn.isSelected = false
            menuVCDelegate.levelTwoBtn.isSelected = true
            menuVCDelegate.levelThreeBtn.isSelected = false
            menuVCDelegate.levelFourBtn.isSelected = false
            
            break
        case 2:
            menuVCDelegate.levelOneBtn.isSelected = false
            menuVCDelegate.levelTwoBtn.isSelected = false
            menuVCDelegate.levelThreeBtn.isSelected = true
            menuVCDelegate.levelFourBtn.isSelected = false
            
            break
        case 3:
            menuVCDelegate.levelOneBtn.isSelected = false
            menuVCDelegate.levelTwoBtn.isSelected = false
            menuVCDelegate.levelThreeBtn.isSelected = false
            menuVCDelegate.levelFourBtn.isSelected = true
            break
        default:
            break
        }
 }
    // Custom method to highlight the selected range button and also changing the background image for the other range buttons.
    func setRangebtnBackgroundImage(sender:UIButton)
    {
        if sender.currentBackgroundImage == #imageLiteral(resourceName: "Rectangle_off")
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "Rectangle_on"), for: .normal)
            sender.setTitleColor(TextColors.kWhiteColor , for: .normal)
            switch sender.tag {
            case 0:
                
                resetButtonState(sender: menuVCDelegate.rangeMediumBtn, str: "range")
                resetButtonState(sender: menuVCDelegate.rangeHighBtn, str: "range")
                break
            case 1:
                resetButtonState(sender: menuVCDelegate.rangeLowBtn, str: "range")
                resetButtonState(sender: menuVCDelegate.rangeHighBtn, str: "range")
                break
            case 2:
                resetButtonState(sender: menuVCDelegate.rangeMediumBtn, str: "range")
                resetButtonState(sender: menuVCDelegate.rangeLowBtn, str: "range")
                break
                
            default:
                break
            }
        }
    }
    
    // Custom method to highlight the selected category button and also changing the background image for the other category buttons.
    func setCategorybtnBackgroundImage(sender:Int)
    {
        switch sender {
        case 0:
            
            menuVCDelegate.categoryPlusBtn.isSelected = true
            menuVCDelegate.categoryMinusBtn.isSelected = false
            menuVCDelegate.categoryMultiplyBtn.isSelected = false
            menuVCDelegate.categoryDivisionBtn.isSelected = false
            
            break
        case 1:
            menuVCDelegate.categoryPlusBtn.isSelected = false
            menuVCDelegate.categoryMinusBtn.isSelected = true
            menuVCDelegate.categoryMultiplyBtn.isSelected = false
            menuVCDelegate.categoryDivisionBtn.isSelected = false
            
            break
        case 2:
            menuVCDelegate.categoryPlusBtn.isSelected = false
            menuVCDelegate.categoryMinusBtn.isSelected = false
            menuVCDelegate.categoryMultiplyBtn.isSelected = true
            menuVCDelegate.categoryDivisionBtn.isSelected = false
            
            break
        case 3:
            menuVCDelegate.categoryPlusBtn.isSelected = false
            menuVCDelegate.categoryMinusBtn.isSelected = false
            menuVCDelegate.categoryMultiplyBtn.isSelected = false
            menuVCDelegate.categoryDivisionBtn.isSelected = true
            break
        default:
            break
        }
    }
    
    // Custom method to reset the background images and the text color of the selected button.
    func resetButtonState(sender:UIButton, str:String){
        
        switch str {
        case "level":
            sender.setBackgroundImage(#imageLiteral(resourceName: "selected_off"), for: .normal)
            sender.setTitleColor(TextColors.kBrownTextColor , for: .normal)
            break
        case "range":
            sender.setBackgroundImage(#imageLiteral(resourceName: "Rectangle_off"), for: .normal)
            sender.setTitleColor(TextColors.kBrownTextColor , for: .normal)
            break
        default:
            break
        }
    }
    
    //MARK:- Custom methods to restore the data
    
    
    // Method to restore difficulty level value from the data which was already selected by the user and shown in the menu view controller.
    
    func restoreMathFactLevel()
    {
        setLevelbtnBackgroundImage(sender:AppdelegateRef.appDelegate.MathFactsLevel)
        
        menuVCDelegate.selectedLevel = AppdelegateRef.appDelegate.MathFactsLevel
    }
    
    // Method to restore numbers range value from the data which was already selected by the user and shown in the menu view controller.
    
    func restoreNumberSet()
    {
        
        switch  AppdelegateRef.appDelegate.MathFactsRange {
        case 0:
            
            menuVCDelegate.rangeLowBtn.setBackgroundImage(#imageLiteral(resourceName: "Rectangle_on"), for: .normal)
            menuVCDelegate.rangeLowBtn.setTitleColor(TextColors.kWhiteColor, for: .normal)
            break
        case 1:
            
            menuVCDelegate.rangeMediumBtn.setBackgroundImage(#imageLiteral(resourceName: "Rectangle_on"), for: .normal)
            menuVCDelegate.rangeMediumBtn.setTitleColor(TextColors.kWhiteColor, for: .normal)
            break
        case 2:
            
            menuVCDelegate.rangeHighBtn.setBackgroundImage(#imageLiteral(resourceName: "Rectangle_on"), for: .normal)
            menuVCDelegate.rangeHighBtn.setTitleColor(TextColors.kWhiteColor, for: .normal)
            break
        default:
            break
        }
        
        menuVCDelegate.selectedNumberRange = AppdelegateRef.appDelegate.MathFactsRange
        
    }
    
    // Method to restore operation category value from the data which was already selected by the user and shown in the menu view controller.
    
    func restoreBasicCatagory()
    {
        setCategorybtnBackgroundImage (sender: AppdelegateRef.appDelegate.MathFactsCatagory)
        menuVCDelegate.selectedCategory = AppdelegateRef.appDelegate.MathFactsCatagory
    }
    
    // Method to restore drill timer value from the data which was already selected by the user and shown in the menu view controller.
    func resetDrillTimer()
    {
        menuVCDelegate.sliderTimerValue = AppdelegateRef.appDelegate.MathFactsTimerMax
        menuVCDelegate.timerSlider.setValue(Float(menuVCDelegate.sliderTimerValue), animated: true)
        menuVCDelegate.timerValueLbl.text = String(menuVCDelegate.sliderTimerValue)
    }
    
    // Method to restore questions number range value from the data which was already selected by the user and shown in the menu view controller.
    
    func resetQuestionTimer()
    {
        menuVCDelegate.sliderQuestionCountValue = AppdelegateRef.appDelegate.MathFactsQuestionMax
        menuVCDelegate.questionsSlider.setValue(Float(menuVCDelegate.sliderQuestionCountValue), animated: true)
        
        menuVCDelegate.questionsValueLbl.text = String(menuVCDelegate.sliderQuestionCountValue)
        
    }
    
    //MARK:- Swipe Gesture custom action Methods
    
    // Swipe gesture left
    // Custom method to do some operations when the user swipes left side.
    func handleSwipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        let location = recognizer.location(in: menuVCDelegate.view)
        print("Fact: left swipe started at \(location.x), \(location.y)")
    }
    
    // Swipe gestures right
    // Custom method to do some operations when the user swipes right side.
    func handleSwipeRight(recognizer:UISwipeGestureRecognizer)
    {
        let location = recognizer.location(in: menuVCDelegate.view)
        print("Fact: left swipe started at \(location.x), \(location.y)")
    }
    
    // MARK:- Custom Button Action Methods
    
    // Custom method to select the difficulty level.
    
    func levelButtonSelected(sender:UIButton)
    {
        switch sender.tag {
        case 0:
            setLevelbtnBackgroundImage(sender: sender.tag)
            break
        case 1:
            setLevelbtnBackgroundImage(sender: sender.tag)
            break
        case 2:
            setLevelbtnBackgroundImage(sender: sender.tag)
            break
        case 3:
            setLevelbtnBackgroundImage(sender: sender.tag)
            break
        default:
            break
        }
        
        menuVCDelegate.selectedLevel = sender.tag
        
    }
    // Custom method to set the numbers in a certain range which have to be appered in the arithmetic operations.
    
    func rangeButtonSelected(sender:UIButton)
    {
        switch sender.tag {
        case 0:
            setRangebtnBackgroundImage(sender: sender)
            break
        case 1:
            setRangebtnBackgroundImage(sender: sender)
            break
        case 2:
            setRangebtnBackgroundImage(sender: sender)
            break
        default:
            break
        }
        
        menuVCDelegate.selectedNumberRange = sender.tag
    }
    
    
    // Custom method to set the which type of arithmetic category will be appeared.
    
    func categoryButtonSelected(sender:UIButton)
    {
        switch sender.tag {
        case 0:
            setCategorybtnBackgroundImage(sender: sender.tag)
            break
        case 1:
            setCategorybtnBackgroundImage(sender: sender.tag)
            break
        case 2:
            setCategorybtnBackgroundImage(sender: sender.tag)
            break
        case 3:
            setCategorybtnBackgroundImage(sender: sender.tag)
            break
        default:
            break
        }
        
        menuVCDelegate.selectedCategory = sender.tag
    }
    // Custom method to set time for the speed drill.
    func timerSliderAction(sender:UISlider)
    {
        let timeSlider = sender
        
        menuVCDelegate.sliderTimerValue = Int(timeSlider.value)
        
        menuVCDelegate.timerValueLbl.text = String(menuVCDelegate.sliderTimerValue)
        
    }
    
    // Custom methhod to set how many question user want to answer in a specific time period.
    func questionSliderAction(sender:UISlider){
        
        let questionSlider = sender
        menuVCDelegate.sliderQuestionCountValue = Int(questionSlider.value)
        
        menuVCDelegate.questionsValueLbl.text = String(menuVCDelegate.sliderQuestionCountValue)
        
    }
    //Custom function used to change the switch On-off states
    func stateChanged(switchState: UISwitch) {
       
        if switchState.isOn
        {
           menuVCDelegate.soundSwitch.isOn = true
            
         } else {
           
            menuVCDelegate.soundSwitch.isOn = false
        }
    }
}
