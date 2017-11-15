//
//  MenuViewController.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 13/05/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import Foundation

class MenuViewController: UIViewController {
    
    
    //MARK: Outlet connections
    
    //  @IBOutlet weak var infoButton: UIButton!

    
    @IBOutlet weak var closeBtn: UIButton!// Button to close the menu options.
    @IBOutlet weak var levelBtnsView: UIView!// View to show the all levels.
    @IBOutlet weak var rangeBtnsView: UIView!// View to show the all number ranges.
    @IBOutlet weak var categoryBtnsView: UIView!// View to show the all arithmetic operations.
    
    @IBOutlet weak var soundSwitch: UISwitch!// This switch is used for sound On-Off option

    
    // Level Buttons
    @IBOutlet weak var levelOneBtn: UIButton!// Button to select the level one.
    @IBOutlet weak var levelTwoBtn: UIButton!// Button to select the level two.
    @IBOutlet weak var levelThreeBtn: UIButton!// Button to select the level three.
    @IBOutlet weak var levelFourBtn: UIButton!// Button to select the level four.
    
    // Range Buttons
    @IBOutlet weak var rangeLowBtn: UIButton!// Button to select the number range of 2-3.
    @IBOutlet weak var rangeMediumBtn: UIButton!// Button to select the number range of 2-5.
    @IBOutlet weak var rangeHighBtn: UIButton!// Button to select the number range of 2-9.
    
    // Category Buttons
    @IBOutlet weak var categoryPlusBtn: UIButton!// Button to select the plus operator category.
    @IBOutlet weak var categoryMinusBtn: UIButton!// Button to select the minus operator category.
    @IBOutlet weak var categoryMultiplyBtn: UIButton!// Button to select the multiply operator category.
    @IBOutlet weak var categoryDivisionBtn: UIButton!// Button to select the division operator category.
    
    // Timer
    @IBOutlet weak var timerSlider: UISlider!// Slider to select the time.
    @IBOutlet weak var timerValueLbl: UILabel!// Label to Show the selected timer value.
    
    // Question
    @IBOutlet weak var questionsSlider: UISlider!// Slider to select the number of questions.
    @IBOutlet weak var questionsValueLbl: UILabel!// Label to Show the selected number of questions.
    
    //MARK:- Variable Declarations
    var selectedLevel:Int! // To store the level data.
    var selectedNumberRange:Int!// To store the selected numbers range.
    var selectedCategory:Int! // To store the selected category.
    var sliderQuestionCountValue:Int!// To store the selected no. of questions value.
    var sliderTimerValue:Int!// To store the timer value.
    let defaults = UserDefaults.standard
   
    
    var menuViewModel:MenuViewModel!
    
    //MARK:- View life cycle methods
    
    //This method is called after the view controller has loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Method which is used to get the reference of 'view controller' into the 'view model' and vise versa.
          configuration()
        
        //Method which is used to load the intial designs.
        menuViewModel.initialLoading()
        
        // Method to initialize the Swipe Gesture  to all directions in the view.
        menuViewModel.addingGestures()
        
        //Method to restore the mathfact level which was previously saved.
        menuViewModel.restoreMathFactLevel()
        
        //Method to restore the number range from the previously selected values.
        menuViewModel.restoreNumberSet()
        
        //Method to restore the category of arithmetic operations from the previously selected values.
        menuViewModel.restoreBasicCatagory()
        
        //Method to restore the time slider values from the previously selected values.
        menuViewModel.resetDrillTimer()
        
        //Method to restore the question number slider values from the previously selected values.
        menuViewModel.resetQuestionTimer()
    }
    
    // Notifies the view controller that its view is about to be removed from a view hierarchy.
    override func viewWillDisappear(_ animated: Bool) {    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Custom Methods
    
    // Custom method used to get the reference of the `view model` in this view controller. By using this reference we can access the properties and methods present in view model and vise versa
    func configuration(){
        menuViewModel = MenuViewModel()
        menuViewModel.menuVCDelegate = self
    }
    
    
    //MARK:- Button Actions
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Button action to set the level.
    @IBAction func levelSelectedBtnAction(_ sender: UIButton) {
        menuViewModel.levelButtonSelected(sender: sender)
    }
    
    // Button action to set the numbers range.
    @IBAction func rangeSelectedBtnAction(_ sender: UIButton) {
        
        menuViewModel.rangeButtonSelected(sender: sender)
    }
   // This action is used for on-off the sound.
   @IBAction func stateChanged(switchState: UISwitch) {
    menuViewModel.stateChanged(switchState: switchState)
    }
    // Button action to set the math operator category.
    @IBAction func categorySelectedBtnAction(_ sender: UIButton) {
        
        menuViewModel.categoryButtonSelected(sender: sender)
        
    }
    
    // Slider action to set the values in timer slider.
    @IBAction func timeSliderAction(_ sender: UISlider) {
        
        menuViewModel.timerSliderAction(sender: sender)
    }
    
    // Slider action to set the range of questions in the slider.
    @IBAction func questionSliderAction(_ sender: UISlider) {
        
        menuViewModel.questionSliderAction(sender: sender)
    }
    // Button action to move to another view controller.
    @IBAction func doneButtonAction(_ sender: UIButton) {
        
        AppdelegateRef.appDelegate.MathFactsLevel = selectedLevel// Saving the level value to appdelegate.
        
        AppdelegateRef.appDelegate.MathFactsRange = selectedNumberRange// Saving the number set range value to appdelegate.
        
        AppdelegateRef.appDelegate.MathFactsCatagory = selectedCategory// Saving the arithmetic  category value to appdelegate.
        
        AppdelegateRef.appDelegate.MathFactsTimerMax = sliderTimerValue// Saving the time slider value to appdelegate.
        
        AppdelegateRef.appDelegate.MathFactsQuestionMax = sliderQuestionCountValue// Saving the questions numbers value to appdelegate.
        
        // Method to save the data i.e. level, numbers range, math operator, time and no. of questions into the data.plist.
        menuViewModel.dataSavingToPlist()
        
        if(soundSwitch.isOn == true)
        {
            defaults.set("On", forKey: "sound")
        }
        else
        {
        defaults.set("Off", forKey: "sound")
        }
        defaults.synchronize()
        
        let nextVC =  StoryBoards.kMainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.kMathFactsVC) as! MathFactsViewController
        
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    //MARK:- Custom swipe guesture methods
    
    // Custom action for left side swipe gesture.
    func handleSwipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        menuViewModel.handleSwipeLeft(recognizer: recognizer)
    }
    
    // Custom action for right side swipe gesture.
    func handleSwipeRight(recognizer:UISwipeGestureRecognizer)
    {
        menuViewModel.handleSwipeRight(recognizer: recognizer)
    }
    
    
}
