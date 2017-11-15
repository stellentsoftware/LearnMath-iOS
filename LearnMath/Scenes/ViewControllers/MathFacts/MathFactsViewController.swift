//
//  ViewController.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/10/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import AudioToolbox

class MathFactsViewController: UIViewController,UIScrollViewDelegate
{
    var mathFactsViewModel:MathFactsViewModel!
    // MARK: - Outlets Connections
    
    // Varables for Addition and Multiplication
    
    @IBOutlet var randomNumber1Lbl: UILabel! //Random number displayed in Top first lbl before equal(=) symbol
    @IBOutlet var randomNumber2Lbl: UILabel! //Random number displayed in Top second lbl before equal(=) symbol
    @IBOutlet var mathFactsAnswer1Lbl: UILabel! //Answer displayed after equal(=) symbol
    @IBOutlet var mathFactsAnswer2Lbl: UILabel! //This label appears when the answer is two digits for first Equation and this label is second digit. Initially it is hidden
    
    @IBOutlet var input1Lbl: UILabel!  // Bottom first lbl before equal(=) symbol
    @IBOutlet var input2Lbl: UILabel!  // Bottom second lbl before equal(=) symbol
    @IBOutlet var inputAnswer1Lbl: UILabel!  //Bottom first lbl after equal(=) symbol
    @IBOutlet var inputAnswer2Lbl: UILabel!  //This label appears when the answer is two digits for second Equation and this label is second digit. Initially it is hidden
    
    @IBOutlet var mathOperatorSign1Lbl: UILabel! //Displaying the math operator in bottom line
    @IBOutlet var mathOperatorSign2Lbl: UILabel! //Displaying the math operator in Top line
    @IBOutlet var Equals1Lbl: UILabel! //Dispalying the "=" symbol in Top equation
    @IBOutlet var Equals2Lbl: UILabel! //Dispalying the "=" symbol in bottom equation
    @IBOutlet var AMView: UIView! // Addition and Multiplication View. In this view Addition and Multiplications are performed.
    @IBOutlet var animationSmallView: UIView! //This view is displayed in the middle of the IConview
    @IBOutlet var animationLargeView: UIView!//This view is displayed in the outer view of the middleView
    // Varables for Subtraction and Division
    @IBOutlet var SDView: UIView! //Subtraction and Division View. In this View Subtraction and Division actions are performed.
    
    @IBOutlet var referenceEqnLbl: UILabel! //Displaying equation in leftside of view in subtraction and division
    
    @IBOutlet var mathFactsAnswer3Lbl: UILabel! // equation answer in this label
    
    @IBOutlet var mathFactsAnswer4Lbl: UILabel! // Displaying equation answer in this label
    
    
    @IBOutlet var SDInput1Lbl: UILabel! // Displaying input label after answer label
    @IBOutlet var SDInput2Lbl: UILabel! // Displaying second label after second operator
    
    @IBOutlet var SDInput3Lbl: UILabel! // Displaying input label after the answer in bottomView
    @IBOutlet var SDInput4Lbl: UILabel! // Displaying second label after second operator in bottom View
    
    @IBOutlet var arrowsView:UIView! // This view is used for  display the arrows when entering the wrong numbers are entered in input View for addition and multiplication.
    @IBOutlet var popOverView: UIView! //Displaying the alert text in This View.
    
    
    @IBOutlet var mathoperator1Lbl: UILabel! //This label is used to display the mathoperator in SDView after the mathFactsAnswer3Lbl
    @IBOutlet var mathoperator2Lbl: UILabel! //This label is used to display the mathoperator in SDView after the SDInput1Lbl
    @IBOutlet var mathoperator3Lbl: UILabel! //This label is used to display the mathoperator in SDView after the mathFactsAnswer4Lbl
    @IBOutlet var mathoperator4Lbl: UILabel! //This label is used to display the mathoperator in SDView after the SDInput3Lbl
    
    @IBOutlet var forkedArrowView: UIView! //This image dispay the arrow inbetween the reference equation and input labels in SDView.
    
    @IBOutlet var iconView: UIView! //Displaying the starting animation relaed views and images are displayed in this view
    @IBOutlet var animationView:UIView! // This View is used to display the panda gif after 4 correct answers for 2 seconds.
    
    @IBOutlet var animationImage:UIImageView! // This imageView is used for display the panda gif after 4 correct answers for 2 seconds.
     @IBOutlet var tapToDismissLbl: UILabel! // Displaying the text in animationView
     @IBOutlet var animationViewBtn:UIButton! //This button is used for displayed on the animation View to dismiss the animation View.
    @IBOutlet var iconCircleImage:UIImageView!       // Animation screen circle icon
    @IBOutlet var middleLogoIcon:UIImageView!      // Animation screen middle icon
    
    
    @IBOutlet var backgroundImage:UIImageView!  // Animation screen background image
    
    @IBOutlet weak var headerView: UIView!// Header view.
    @IBOutlet var learnFactsLbl: UILabel! //Title label
    
    
    @IBOutlet var iconPlusBtn:UIButton!  //Button used for display "+" icon for animation
    @IBOutlet var iconMinusBtn:UIButton! //Button used for display "-" icon for animation
    @IBOutlet var iconTimesBtn:UIButton!//Button used for display "x" icon for animation
    @IBOutlet var iconDivideBtn:UIButton! //Button used for display "÷" icon for animation
    @IBOutlet var PositiveReinforcementLbl: UILabel!
    
    @IBOutlet var firstView: UIView! //In this view Numbers 1,2,3 are displaying
    @IBOutlet var secondView: UIView! //In this view Numbers 4,5,6 are displaying
    @IBOutlet var thirdView: UIView! //In this view Numbers 7,8,9 are displaying
    @IBOutlet var fourthView: UIView! //In this view Number 0 is displaying
    //MARK:- CouchmarkScreen Declarations
    @IBOutlet var couchmarkScrollView:UIScrollView!
    @IBOutlet var couchmarkView: UIView! //The couchmarkScrollView is subview to this View
    //MARK:- popoverViewsDeclaration
    @IBOutlet var popUpTitleView: UIView!//  In this displays the title and cross button in the popover view
    @IBOutlet var popUpmessageView: UIView! //In this View alert text is displayed.
    
    @IBOutlet var pageControl:UIPageControl!
    //MARK:- Variable Declarations
    var downLeftArrow: UIImageView! //Image for Displaying the downLeftarrow when entering the wrong number in AMView
    var downRightArrow: UIImageView! //Image for Displaying the downRightarrow when entering the wrong number in AMView
    var firstRandomNum:Int = 0 //This is used for assigning the first random number
    var secondRandomNum:Int = 0 //This is used for assigning the second random number
    var calculatedAnswer:Int = 0 //This is used for assigning the caliculated answer according to the operator.
    
    var inputPhase:Int = 0 //This variable is used in switch case
    var answerVar:Int = 0 //This is used for assigning the numbers when button is selected as sender tag and
    var getNewFact:Int = 0 //This variable is assigned for correct answer and play ding sound
    
    var elapsedSeconds:Int = 0 //Timer is used for calling the GenNextFact after certain time and after entering the correct answer.
    var firstResponse:Int = 0 //This variable is used in subtraction and division for comparing and swapping the numbers
    var secondResponse:Int = 0 //This variable is used in subtraction and division for comparing and swapping the numbers
    var calcResult:Int = 0 //This variable is used for saving the caliculated answers
    
    var transMathOppStr:String = "" //This operator is used to display the opposite operators in subtraction and division
    
    var spaceStr:String = "" //Displaying the space between the numbers
    var responseError: Bool = Bool() // Assigning the response when button is selected and playing the releated audio
    // Common Variables
    var ErrorOnThisQuestion: Bool = Bool() //This is used for displaying the PositiveReinforcementLbl by getting the correct answer or not with the response
    var spinningIconUp: Bool = Bool() //This is used for displaying the first animation or not.
    var timeForNewNumbers:Timer! //This timer is used to call the random number generating function. with certain timer interval
    var elapsedTime:Timer! //Timer used to score the performance
    var mathOppStr:String = "" //This is used for displaying the math operator
    var selectedGifIndex:Int = 0 //This variable is used for getting the gif from the gifArray in the constant
    var questionCount:Int = 1 //used for getting the questions count for displaying the PositiveReinforcementLbl
    var selectedLevel:Int = 0 // used to retrive the math level from Plist and retrive the random number using selected math level. If value is empty assigning the default value to plist.
    var selectedNumberRange:Int = 0 // used to retrive the math level from Plist and retrive the random number using selected number range.If value is empty assigning the default value to plist.
    var selectedSegmentBasics:Int = 0 // used to retrive the math operator and perform the action If value is empty assigning the default action as "+".
    
    var sliderQuestionCountValue:Int = 0 // used to retrive the questions count from plist. If value is empty assigning the default value to plist.
    var sliderTimerValue:Int = 0 // used to retrive the timer value from plist. If value is empty assigning the default value (60) to plist.
    let defaults = UserDefaults.standard //Using use default for checking sound is in On_Off
    
    
    
    var iconPlusSignLarge:UIImageView!   // Math operator Image pointers "+"
    var iconMinusSignLarge:UIImageView! // Math operator Image pointers"-"
    var iconTimesSignLarge:UIImageView! // Math operator Image pointers "x"
    var iconDivideSignLarge:UIImageView! // Math operator Image pointers "÷"
    var iconCurrentSignLarge:UIImageView! // Math operator Image pointers
    
    var iconTimer:Timer = Timer() //Timer used for dispaying the animation
    
    // These are used for changing the x and y position of math operators
    
    var divideX : Float = 0.0 //divide x position
    var divideY: Float = 0.0  //divide y position
    var plusX: Float = 0.0    //plus x position
    var plusY: Float = 0.0    //plus y position
    var timesX: Float = 0.0   //Multiplication x position
    var timesY: Float = 0.0   //Multiplication y position
    var minusX: Float = 0.0   //minus x position
    var minusY: Float = 0.0   //minus y position
    
    // Icon Animation variables
    var angle:CGFloat = 0.35 // line up starting position with initial load image
    var radius:Float = 100
    var offset:CGFloat = 0.8853
    var gifImagesArray:[Data] = [Data]()//This Array is used to save the gifs after converting them in to data. And displayed them the gifs Animations according to the selectedGifIndex in Success response.
    
    
    
    
    
    // MARK: - Life Cycle Methods
    // This method is called after the view controller has loaded its view hierarchy.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Method which is used to get the reference of 'view controller' into the 'view model' and vise versa.
        self.configuration()
        
        //Method which is used to load the intial designs.
        mathFactsViewModel.initialloading()
        // Method to create the urls for the audio files, Store the sound URL instance and Create a system sound object representing the sound file.
        if (defaults.string(forKey: "sound") == "On")
        {
            // Method to create the urls for the audio files, Store the sound URL instance and Create a system sound object representing the sound file.
            AudioFilesConstant.kSoundFileObject.audioSoundsFilesData()
         } else {
            // Method which is used to remove the reference of sound files from Sound fileobject
            AudioFilesConstant.kSoundFileObject.disposeAudioSoundsFilesData()
        }
        }
    override func viewWillAppear(_ animated: Bool)
    {
        if(AppdelegateRef.appDelegate.islaunch == false)
        {
            mathFactsViewModel.endAnimations()
         } else {
            AppdelegateRef.appDelegate.islaunch = false
        }
    }
    //Changing the frames according to the device
    override func viewWillLayoutSubviews()
    {
        mathFactsViewModel.viewWillLayoutSubviews()
    }
    override func viewDidDisappear(_ animated: Bool) {
        mathFactsViewModel.endAnimations()
    }
    // MARK:- Custom Methods
    
    // Custom method used to get the reference of the `view model` in this view controller. By using this reference we can access the properties and methods present in view model and vise versa.
    func configuration(){
        mathFactsViewModel  = MathFactsViewModel()
        mathFactsViewModel.mathsFactsVCDelegate = self
    }
    
    //Custom Method to apply the animation for rotating the arrows images and the button images in circular order.
    func setAnimationImages()
    {
        mathFactsViewModel.setAnimationImages()
    }
    
    // Custom mehod to show the flash image which was select in initial screen with the fade animations.
    func flashIcon()
    {
        mathFactsViewModel.flashIcon()
    }
    
    // Custom method to show the fade animations when user swipes.
    func fadeInAnimationFinished(animationID:String,finished:NSNumber,context:UnsafeMutableRawPointer)
    {
        mathFactsViewModel.fadeInAnimationFinished(animationID: animationID, finished: finished, context: context)
    }
    // Custom method to show Circular animation
    func iconTimerMethod(timer:Timer)
    {
        mathFactsViewModel.iconTimerMethod(timer: timer)
    }
    
    
    func secondsCounter()
    {
        elapsedSeconds = elapsedSeconds+1
    }
    
    // Method to get the numbers randomly in the selected range for the operation.
    func GenNextFact()
    {
        mathFactsViewModel.GenNextFact()
    }
    
    // MARK:- Button Actions
    
    // Button action for the digits clicked in the custom number keyboard.
    @IBAction func buttonDigitPressed(sender: UIButton)
    {
        mathFactsViewModel.buttonDigitPressed(sender: sender)
    }
    
    // Button action to show the details about the view controller.
    
    @IBAction func infoBtnAction(sender: UIButton) {
        
        mathFactsViewModel.showMathFactsGeneralInfo()
    }
    
    // Button action to present the menu view controller.
    @IBAction func menuBtnAction(sender: UIButton) {
        
        mathFactsViewModel.buttonMenuView()
    }
    @IBAction func alertCloseBtnAction(sender: UIButton) {
        
        popOverView.isHidden = true
    }
    @IBAction func touchBtnAction(sender: UIButton)
    {
        mathFactsViewModel.touchBtnAction(sender: sender)
    }
    //CouchMarks Exit ButtonAction
    @IBAction func exitBtnAction(sender: UIButton)
    {
        mathFactsViewModel.exitBtnAction(sender: sender)
    }
    //Home button Action
    @IBAction func homeButtonAction(_ sender: UIButton) {
        mathFactsViewModel.homeButtonAction(sender: sender)
    }
    @IBAction func animationViewBtnAction(_ sender: UIButton) {
        animationView.isHidden = true
        timeForNewNumbers.invalidate()
        GenNextFact()
    }
    // Couchmarks button Action
    @IBAction func couchmarkButtonAction(_ sender: UIButton) {
        mathFactsViewModel.couchmarkButtonAction(sender: sender)
    }
    // MARK: - Gesture Action Methods
    
    // Custom action for left side swipe gesture.
    func handleSwipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true &&  couchmarkView.isHidden == true
        {
            mathFactsViewModel.handleSwipeLeft(recognizer: recognizer)
        }
    }
     // Custom action for right side swipe gesture.
    func handleSwipeRight(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true &&  couchmarkView.isHidden == true
        {
            mathFactsViewModel.handleSwipeRight(recognizer: recognizer)
        }
    }
    
    // Custom action for up side swipe gesture.
    func handleSwipeUp(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true &&  couchmarkView.isHidden == true
        {
            
            mathFactsViewModel.handleSwipeUp(recognizer: recognizer)
        }
    }
    
    func handleSwipeUpInCouchMarkScreen(recognizer:UISwipeGestureRecognizer)
    {
        self.couchmarkScrollView.contentOffset = CGPoint(x: DeviceModel.SCREEN_WIDTH*2, y: DeviceModel.SCREEN_HEIGHT)
    }
    
    
    // Custom action for down side swipe gesture.
    func handleSwipeDown(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true &&  couchmarkView.isHidden == true
            
        {
            mathFactsViewModel.handleSwipeDown(recognizer: recognizer)
        }
    }
    // Custom action for Tap gesture.
    
    func tapRecognise(recognizer:UITapGestureRecognizer)
    {
        mathFactsViewModel.tapRecognise(recognizer: recognizer)
    }
    // Custom method to add the touch event to the math operators in the initial view.
    func touchesBegan(touches:NSSet,event:UIEvent)
    {
        mathFactsViewModel.touchesBegan(touches: touches, event: event)
    }
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let pageWidth: CGFloat = DeviceModel.SCREEN_WIDTH
        let currentPage: CGFloat = floor(((couchmarkScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        pageControl.currentPage = Int(currentPage)
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
        }, completion: {(_ finished: Bool) -> Void in
            
            
        })
        if(couchmarkScrollView.contentSize.width>DeviceModel.SCREEN_WIDTH*4)
        {
            couchmarkScrollView.contentOffset.x = DeviceModel.SCREEN_WIDTH*4
        }
        if(couchmarkScrollView.contentOffset.y>0||couchmarkScrollView.contentOffset.y<0)
        {
            couchmarkScrollView.contentOffset.y = 0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
