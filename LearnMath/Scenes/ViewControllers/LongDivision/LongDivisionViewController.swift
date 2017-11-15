//
//  LongDivisionViewController.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 10/05/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import AudioToolbox

class LongDivisionViewController: UIViewController {
    
    //MARK:- Outlet Connections
    
    var pageControl: UIPageControl! = UIPageControl()// Page Control to show the page number.
    
    @IBOutlet weak var headerView: UIView!// Header view.
    @IBOutlet weak var alertPopOverView: UIView!// Alert pop over view.
    
    @IBOutlet weak var applyFactsLbl: UILabel!// Title label.
    //Label outlets
    @IBOutlet weak var quotientLabel: UILabel! // Label to show the quotient value.
    @IBOutlet weak var divisorLabel: UILabel!// Label to show the divisor value.
    @IBOutlet weak var dividendLabel: UILabel!// Label to show the dividend value.
    @IBOutlet weak var firstRemPartDivLabel: UILabel!// Label to show the first remainder value.
    @IBOutlet weak var firstProductLabel: UILabel!// Label to show the first product value.
    @IBOutlet weak var firstProductLineLabel: UILabel!// Label to seperate the first product value and the first remainder value.
    @IBOutlet weak var secondRemPartDivLabel: UILabel!// Label to show the second remainder value.
    @IBOutlet weak var secondProductLabel: UILabel!// Label to show the second product value.
    @IBOutlet weak var secondProductLineLabel: UILabel!// Label to seperate the second product value and the second remainder value.
    @IBOutlet weak var thirdRemPartDivLabel: UILabel!// Label to show the third remainder value.
    @IBOutlet weak var thirdProductLabel: UILabel!// Label to show the third product value.
    @IBOutlet weak var thirdProductLineLabel: UILabel!// Label to seperate the third product value and the third remainder value.
    @IBOutlet weak var fourthRemPartDivLabel: UILabel!// Label to show the fourth remainder value.
    @IBOutlet weak var fourthProductLabel: UILabel!// Label to show the fourth product value.
    @IBOutlet weak var fourthProductLineLabel: UILabel!// Label to seperate the fourth product value and the fourth remainder value.
    
    // Image view outlets
     @IBOutlet weak var arrowsView: UIView! // View that contains arrow images.
    @IBOutlet weak var divDropArrow2: UIImageView! // ImageView to show the dropdown arrow image for the next number after first product.
    @IBOutlet weak var divDropArrow3: UIImageView! // ImageView to show the dropdown arrow image for the next number after second product.
    @IBOutlet weak var divDropArrow4: UIImageView! // ImageView to show the dropdown arrow image for the next number after the third product.
    
    //MARK:- popoverViewsDeclaration
    @IBOutlet var popUpTitleView: UIView!//  In this displays the title and cross button in the popover view
    @IBOutlet var popUpmessageView: UIView! //In this View alert text is displayed.
    
    
    @IBOutlet var animationView:UIView! // This View is used to display the panda gif after 4 correct answers for 2 seconds.
    
    @IBOutlet var animationImage:UIImageView! // This imageView is used for display the panda gif after 4 correct answers for 2 seconds.
    @IBOutlet var tapToDismissLbl: UILabel! // Displaying the text in animationView
    @IBOutlet var animationViewBtn:UIButton! //This button is used for displayed on the animation View to dismiss the animation View.
     var questionCount:Int! //used for getting the questions count for displaying the PositiveReinforcementLbl
    
    
    //MARK:- Custom Image views
    
    var divRemArrow:UIImageView!    //Long Division Remainder arrow.
    var ErrorOnThisQuestion: Bool = Bool()
    var iconPlusSignLarge:UIImageView!   // Image for the plus sign.
    var iconMinusSignLarge:UIImageView! // Image for the minus sign.
    var iconTimesSignLarge:UIImageView! // Image for the multiply sign.
    var iconDivideSignLarge:UIImageView! // Image for the division sign.
    var iconCurrentSignLarge:UIImageView! // Image to display the current sign.
    var selectedGifIndex:Int! //This variable is used for getting the gif from the gifArray in the constant
    var gifImagesArray:[Data] = [Data]() //This Array is used to save the gifs after converting them in to data. And displayed them the gifs Animations according to the selectedGifIndex in Success response.
    
    //MARK:- Variable Declarations
    
    var intDivisor:Int = Int() // To store the Divisor value(integer).
    var intDividend:Int = Int() // To store the Dividend value.
    var intQuotient:Int = Int() // To store the Quotient value
    var intFirstQuoDigit:Int = Int() // To store the first digit of the quotient.
    var intSecondQuoDigit:Int = Int() // To store the second digit of the quotient.
    var intThirdQuoDigit:Int = Int() // To store the third digit of the quotient.
    var intFourthQuoDigit:Int = Int() // To store the fourth/final digit of the quotient.
    var intRemainderQuoDigit:Int = Int() // To store the final remainder value.
    var numDividendDigits:Int = Int() // To store the number of steps the divison takes.
    var intFirstProduct:Int = Int() // To store the first product value.
    var intFirstRem:Int = Int()// To store the first remainder value.
    var intSecondProduct:Int = Int()// To store the second product value.
    var intSecondRem:Int = Int()// To store the second remainder value.
    var intThirdProduct:Int = Int() // To store the third product value.
    var intThirdRem:Int = Int() // To store the third remainder value.
    var intFourthProduct:Int = Int() // To store the fourth product value.
    var intFourthRem:Int = Int() // To store the fourth remainder value.
    let defaults = UserDefaults.standard //Userdefaults used for checking sound is On-Off

    var mfLevel:Int = Int() // To store the selected level value.
    var mfRange:Int = Int() // To store the selected numbers range value.
    //var questionMax:Int = Int()
    var questionCategory:Int = Int() // To store the arithmetic operation category.
    var inputPhase:Int = Int() // Value that determines the next step of the divison operation.
    
    
    var firstDigit:Int = 0 // First digit of the dividend.
    var secondDigit:Int = 0 // Second digit of the dividend.
    var thirdDigit:Int = 0 // Third digit of the dividend.
    var fourthDigit:Int = 0 // Fourth digit of the dividend.
    var calculatedDigit:Int = 0 // Value that is used to display the products with '-' symbol.
    
    // Timer variables
    var timeForNewNumbers:Timer = Timer() // Timer value
    
    // View Model initialization
    var longDivisionViewModel:LongDivisionViewModel!
    
    //MARK:- View Life Cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration() // Method which is used to get the reference of 'view controller' into the 'view model' and vise versa.
        if questionCount == nil
        {
            questionCount = 1
        }
        if selectedGifIndex == nil
        {
            selectedGifIndex = 0
        }
        inputPhase = 0; // Defines first case for input expected from user
        numDividendDigits = 0; // Get set in the case statement
        
        // Method to initialize the swipe Gestures to directions in the view.
        longDivisionViewModel.swiperInitializeMethod()
        
        
        // Method to get the common data from the appdelegate.
        longDivisionViewModel.dataFromAppDelegate()
        
        if (defaults.string(forKey: "sound") == "On")
        {
        // Method to create the urls for the audio files, Store the sound URL instance and Create a system sound object representing the sound file.
           AudioFilesConstant.kSoundFileObject.audioSoundsFilesData()
         } else {
        // Method which is used to remove the reference of sound files from Sound fileobject
            AudioFilesConstant.kSoundFileObject.disposeAudioSoundsFilesData()
        }
        // Method for custom design
        longDivisionViewModel.initialDesign()
        
        // Method to get the numbers randomly in the selected range for the operation.
        longDivisionViewModel.getNumbers()
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Methods
    
    // Custom method used to get the reference of the `view model` in this view controller. By using this reference we can access the properties and methods present in view model and vise versa.
    func configuration(){
        
        longDivisionViewModel = LongDivisionViewModel()
        longDivisionViewModel.longDivisionVCDelegate = self
    }
    //MARK:- Button Actions
    // Button action for the digits clicked in the custom number keyboard.
    @IBAction func buttonDigitPressed(_ sender: UIButton) {
        
        longDivisionViewModel.buttonWasSelected(sender: sender)
    }
    
    // Button action to show the details about the view controller.
    @IBAction func infoButtonAction(_ sender: Any) {
        
       // longDivisionViewModel.showLongDivisionInfo()
        alertPopOverView.isHidden = false
    }
    
    // Button action to present the menu view controller.
    @IBAction func menuButtonAction(_ sender: Any) {
        
        longDivisionViewModel.buttonMenuView()
    }
    
    // Button action to close the alert.
    @IBAction func alertCloseBtnAction(_ sender: UIButton) {
        
        alertPopOverView.isHidden = true
        
    }
    @IBAction func homeButtonAction(_ sender: UIButton) {
        longDivisionViewModel.homeButtonAction(sender: sender)
    }
    //MARK:- Selector methods
    
    // Custom button action to get the numbers randomly.
    func getNewNumber()
    {
        longDivisionViewModel.getNumbers()
    }
    
    // Custom button action to show/stop the animations when swiped.
    func fadeAnimation()
    {
        longDivisionViewModel.fadeInAnimationFinished()
    }
    
    // Custom action for left side swipe gesture.
    func swipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
        longDivisionViewModel.handleSwipeLeft(recognizer: recognizer)
        }
    }
    // Custom action for right side swipe gesture.
    func swipeRight(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
        longDivisionViewModel.handleSwipeRight(recognizer: recognizer)
        }
    }
    // Custom action for up side swipe gesture.
    func swipeUp(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
        longDivisionViewModel.handleSwipeUp(recognizer: recognizer)
        }
    }
    // Custom action for down side swipe gesture.
    func swipeDown(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
        longDivisionViewModel.handleSwipeDown(recognizer: recognizer)
        }
    }
    @IBAction func animationViewBtnAction(_ sender: UIButton)
    {
        animationView.isHidden = true
        timeForNewNumbers.invalidate()
        getNewNumber()
    }
}
