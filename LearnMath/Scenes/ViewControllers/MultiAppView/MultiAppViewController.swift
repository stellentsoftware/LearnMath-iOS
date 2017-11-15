//
//  MultiAppViewController.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/15/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import AudioToolbox

class MultiAppViewController: UIViewController {
    
    //MARK:- Outlet Connections
    @IBOutlet weak var alertPopOverView: UIView!// Alert pop over view.
    @IBOutlet weak var applyFactsLbl: UILabel!// Title label.
    @IBOutlet weak var pageControl: UIPageControl!// Page Control to show the page number.
    @IBOutlet weak var headerView: UIView!// Header view.
   
    
    @IBOutlet var onesCarryLbl : UILabel!// Ones position carry label for small multiplication, addition and subtraction operations.
    @IBOutlet var tensCarryLbl : UILabel!// Tens position carry label for small multiplication, addition and subtraction  operation.
    @IBOutlet var hundredsCarryLbl : UILabel!// Hundreds position carry label for small multiplication, addition and subtraction operation.
    @IBOutlet var thousandsCarryLbl : UILabel!// Thousands position carry label for small multiplication, addition and subtraction operation.
    //MARK:- popoverViewsDeclaration
    @IBOutlet var popUpTitleView: UIView!//  In this displays the title and cross button in the popover view
    @IBOutlet var popUpmessageView: UIView! //In this View alert text is displayed.
    
    @IBOutlet var firstNumber_SmallLbl : UILabel!//  Multiplier label for small multiplication, addition and subtraction operation.
    @IBOutlet var secondNumber_SmallLbl : UILabel! // Multiplicand label for small multiplication, addition and subtraction operation.
    @IBOutlet var regroupSlashesLbl: UILabel! // Label to show slashes when regroup selected for small multiplication, addition and subtraction operation.
    @IBOutlet weak var responseCarryView: UIView!//This view displayed in smalloperationView which is used to display the addition subtraction and small multiplication response carries.
    @IBOutlet weak var finalresponseCarryView: UIView!//This view displayed in largeoperationView which is used to display the  multiplication final response carries.
    
    @IBOutlet weak var answer1View: UIView!
    @IBOutlet var answer1Lbl: UILabel!// Label to show the answer for small multiplication, addition and subtraction operation.
    @IBOutlet var equationLineLbl : UILabel! // Label to seperate the answer for small multiplication, addition and subtraction operation.
    @IBOutlet var numbersView: UIView! //In this view Numbers 1,2,3 are displaying
    @IBOutlet var firstView: UIView! //In this view Numbers 1,2,3 are displaying
    @IBOutlet var secondView: UIView! //In this view Numbers 4,5,6 are displaying
    @IBOutlet var thirdView: UIView! //In this view Numbers 7,8,9 are displaying
    @IBOutlet var fourthView: UIView! //In this view Number 0 is displaying
    
    
    @IBOutlet var firstNumber_LargeLbl : UILabel!//  Multiplier label for large multiplication operation.
    @IBOutlet var secondNumber_LargeLbl : UILabel!// Multiplicand label for large multiplication operation.
    @IBOutlet var onesCarry_LargeLbl : UILabel!// Ones position carry label for large multiplication operation.
    @IBOutlet var tensCarry_LargeLbl : UILabel!// Tens position carry label for large multiplication operation.
    @IBOutlet var hundredsCarry_LargeLbl : UILabel!// Hundreds position carry label for large multiplication operation.
    @IBOutlet var thousandsCarry_LargeLbl : UILabel!// Thousands position carry label for large multiplication operation.
    
    @IBOutlet var sumOnesCarry_LargeLbl : UILabel!// Ones position carry label after adding the result multiplication for large multiplication operation.
    @IBOutlet var sumTensCarry_LargeLbl : UILabel!// Tens position carry label after adding the result multiplication for large multiplication operation.
    @IBOutlet var sumHundredsCarry_LargeLbl : UILabel!// Hundreds position carry label after adding the result multiplication for large multiplication operation.
    @IBOutlet var sumThousandsCarry_LargeLbl : UILabel!// Thousands position carry label after adding the result multiplication for large multiplication operation.
    @IBOutlet var sumTenThousCarry_LargeLbl : UILabel!// Ten Thousands position carry label after adding the result multiplication for large multiplication operation.
    @IBOutlet var sumHunThousCarry_LargeLbl : UILabel!// Hundred Thousands position carry label after adding the result multiplication for large multiplication operation.
    
    
    @IBOutlet var regroupSlashes_LargeLbl : UILabel!// Label to show slashes when regroup selected for large multiplication operation.
    
    @IBOutlet var firstResult_LargeLbl : UILabel!// Label to show the first result for large multiplication operation.
    @IBOutlet var secondResult_LargeLbl : UILabel!// Label to show the second result for large multiplication operation.
    
    @IBOutlet var finalAnswerView : UIView!
    @IBOutlet var finalAnswer_LargeLbl : UILabel!// Label to show the final answer for large multiplication operation.
    
    @IBOutlet var sumLine_LargeLbl : UILabel!// Label to seperate the final answer for large multiplication operation.
    @IBOutlet var equationLine_LargeLbl : UILabel!// Label to seperate the answer for large multiplication operation.
    
    @IBOutlet var animationView:UIView! // This View is used to display the panda gif after 4 correct answers for 2 seconds.
    
    @IBOutlet var animationImage:UIImageView! // This imageView is used for display the panda gif after 4 correct answers for 2 seconds.
    @IBOutlet var tapToDismissLbl: UILabel! // Displaying the text in animationView
    @IBOutlet var animationViewBtn:UIButton! //This button is used for displayed on the animation View to dismiss the animation View.
    
    var questionCount:Int! //used for getting the questions count for displaying the PositiveReinforcementLbl
    
    //MARK:- Variable Declarations
    var equationMultiplierOnes:Int = 0 // To store the multiplier ones value.
    var equationMultiplierTens:Int = 0 // To store the multiplier tens value.
    var ErrorOnThisQuestion: Bool = Bool() //This is used for displaying the PositiveReinforcementLbl by getting the correct answer or not with the response

    var inputPhase:Int = 0 // Value that determines the next step of the operation.
    var usersAnswer:Int = 0
    var calculatedAnswer:Int = 0
    var finalCalculatedAnswer:Int = 0
    var altOnesCalculatedAnswer:Int = 0 // To store the answer of the first product in the long multiplication.
    var altTensCalculatedAnswer:Int = 0 // To store the answer of the second product in the long multiplication.
    var evolvingAnswer:Int = 0
    var getNewProblem:Int = 0
    
    var calcOnesCarry:Int = 0 // To store the ones carry of the  product in small multiplication.
    var calcTensCarry:Int = 0 // To store the tens carry of the  product in small multiplication.
    var calcHunsCarry:Int = 0 // To store the hundreds carry of the  product in small multiplication.
    var calcThousCarry:Int = 0 // To store the thousands carry of the  product in small multiplication.
    
    var altOnesCalcOnesCarry:Int = 0 // To store the ones carry of the first product in long multiplication.
    var altOnesCalcTensCarry:Int = 0 // To store the tens carry of the first product in long multiplication.
    var altOnesCalcHunsCarry:Int = 0 // To store the hundreds carry of the first product in long multiplication.
    var altOnesCalcThousCarry:Int = 0 // To store the thousands carry of the first product in long multiplication.
    var altOnesCalcTenThousCarry:Int = 0 // To store the ten thousands carry of the first product in long multiplication.
    
    var altTensCalcOnesCarry:Int = 0 // To store the ones carry of the second product in long multiplication.
    var altTensCalcTensCarry:Int = 0 // To store the tens carry of the second product in long multiplication.
    var altTensCalcHunsCarry:Int = 0 // To store the hundreds carry of the second product in long multiplication.
    var altTensCalcThousCarry:Int = 0 // To store the thousands carry of the second product in long multiplication.
    var altTensCalcTenThousCarry:Int = 0 // To store the ten thousands carry of the second product in long multiplication.
    
    var altFinCalcOnesCarry:Int = 0 // To store the ones position carry value of the final sum.
    var altFinCalcTensCarry:Int = 0 // To store the tens position carry value of the final sum.
    var altFinCalcHunsCarry:Int = 0 // To store the hundreds position carry value of the final sum.
    var altFinCalcThousCarry:Int = 0 // To store the thousands position carry value of the final sum.
    var altFinCalcTenThousCarry:Int = 0 // To store the ten thousands position carry value of the final sum.
    var altFinCalcHunThousCarry:Int = 0 // To store the hundred thousands position carry value of the final sum.
    
    var calcOnes:Int = 0 // To store the answer ones value for addition and small multiplication.
    var calcTens:Int = 0  // To store the answer tens value for addition and small multiplication.
    var calcHuns:Int = 0  // To store the answer hundreds value for addition and small multiplication.
    var calcThous:Int = 0  // To store the answer thousands value for addition and small multiplication.
    var calcTenThous:Int = 0  // To store the answer tenthousands value for addition and small multiplication.
    
    var altCalcOnes:Int = 0 // To store the value of the ones place in the second product line in the long multiplication.
    var altCalcTens:Int = 0 // To store the value of the tens place in the second product line in the long multiplication.
    var altCalcHuns:Int = 0 // To store the value of the hundreds place in the second product line in the long multiplication.
    var altCalcThous:Int = 0 // To store the value of the thousands place in the second product line in the long multiplication.
    var altCalcTenThous:Int = 0 // To store the value of the ten thousands place in the second product line in the long multiplication.
    
    var finCalcOnes:Int = 0 // To store the final answer ones value.
    var finCalcTens:Int = 0 // To store the final answer tens value.
    var finCalcHuns:Int = 0 // To store the final answer hundreds value.
    var finCalcThous:Int = 0 // To store the final answer thousands value.
    var finCalcTenThous:Int = 0 // To store the final answer ten thousands value.
    var finCalcHunThous:Int = 0 // To store the final answer hundred thousands value.
    
    var equationOnes:Int = 0 // To store the ones position value of equations second number for substraction operation.
    var equationTens:Int = 0 // To store the tens position value of equations second number for substraction operation.
    var equationHuns:Int = 0 // To store the hundreds position value of equations second number for substraction operation.
    var equationThous:Int = 0 // To store the thousands position value of equations second number for substraction operation.
    
    var firstNumOnes:Int = 0 // To store the ones position value of equations first number for substraction operation.
    var firstNumTens:Int = 0 // To store the tens position value of equations first number for substraction operation.
    var firstNumHuns:Int = 0 // To store the hundreds position value of equations first number for substraction operation.
    var firstNumThous:Int = 0 // To store the thousands position value of equations first number for substraction operation.
    
    var mfCategory:Int = 0 // To store the math operator category.
    var mfNumRange:Int = 0 // To store the numbers range.
    var mfLevel:Int = 0 // To store the level.
    var equationFirstNum:Int = 0 // To store the first value of the operation (If multiplication -> mulitiplier).
    var equationSecondNum:Int = 0 // To store the second value of the operation (If multiplication -> multiplicand).
    var elapsedSeconds:Int = 0 // Timer value.
    
    var responseError: Bool = Bool()
    var isRandom: Bool = Bool() // value to seperate the long multiplication operation.
    
    var TensCarryAlreadySet: Bool = Bool()
    
    var mathOppStr:String = "" // To show the math operator.
    var  spaceStr:String = ""
    var slashOnesStr:String = "" // To show the slash '\' in ones position.
    var slashTensStr:String = "" // To show the slash '\' in tens position.
    var slashHunsStr:String = "" // To show the slash '\' in hundreds position.
    var slashThousStr:String = "" // To show the slash '\' in thousands position.
    
    var iconPlusSignLarge:UIImageView! // Image for the plus sign.
    var iconMinusSignLarge:UIImageView! // Image for the minus sign.
    var iconTimesSignLarge:UIImageView! // Image for the multiply sign.
    var iconDivideSignLarge:UIImageView! // Image for the division sign.
    var iconCurrentSignLarge:UIImageView! // Image to dispaly the current sign.
    var selectedGifIndex:Int! //This variable is used for getting the gif from the gifArray in the constant
    var gifImagesArray:[Data] = [Data]() //This Array is used to save the gifs after converting them in to data. And displayed them the gifs Animations according to the selectedGifIndex in Success response.
    var multiAppViewModel:MultiAppViewModel!// View model reference
    
    var timeForNewNumbers:Timer = Timer()
    var elapsedTime:Timer = Timer()
    
    
    //MARK:- View Life Cycle Methods
    
    // This method is called after the view controller has loaded its view hierarchy
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Method which is used to get the reference of 'view controller' into the 'view model' and vise versa.
        self.configuration()
        if questionCount == nil
        {
            questionCount = 1
        }
        if selectedGifIndex == nil
        {
            selectedGifIndex = 0
        }
        // Method for custom design
        multiAppViewModel.initialloading()
        
        let defaults = UserDefaults.standard
        if (defaults.string(forKey: "sound") == "On")
        {
            // Method to create the urls for the audio files, Store the sound URL instance and Create a system sound object representing the sound file.
            
            AudioFilesConstant.kSoundFileObject.audioSoundsFilesData()
        }
        else
        {
            // Method which is used to remove the reference of sound files from Sound fileobject
            AudioFilesConstant.kSoundFileObject.disposeAudioSoundsFilesData()
        }
       
    }
    //Updating View frame releated to statusbar frame
       //Changing the frames according to the device
    override func viewWillLayoutSubviews()
    {
        multiAppViewModel.viewWillLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Custom Methods
    
    // Custom method used to get the reference of the `view model` in this view controller. By using this reference we can access the properties and methods present in view model and vise versa.
    func configuration()
    {
        multiAppViewModel = MultiAppViewModel()
        multiAppViewModel.multiAppVCDelegate = self
    }
    
    // custom metod to show the flash images.
    func flashIcon()
    {
        multiAppViewModel.flashIcon()
    }
    
    func secondsCounter()
    {
        elapsedSeconds = elapsedSeconds+1
    }
    
    // Method to get the numbers randomly.
    func getNewNumbers()
    {
        multiAppViewModel.getNewNumbers()
    }
    
    
    //MARK:- Swipe methods
    
    // Custom action for left side swipe gesture.
    func swipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
            multiAppViewModel.handleSwipeLeft(recognizer: recognizer)
        }
    }
   
    // Custom action for right side swipe gesture.
    func swipeRight(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
            multiAppViewModel.handleSwipeRight(recognizer: recognizer)
        }
    }
    
    // Custom action for up side swipe gesture.
    func swipeUp(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
            multiAppViewModel.handleSwipeUp(recognizer: recognizer)
        }
    }
    
    // Custom action for down side swipe gesture.
    func swipeDown(recognizer:UISwipeGestureRecognizer)
    {
        if alertPopOverView.isHidden == true
        {
            multiAppViewModel.handleSwipeDown(recognizer: recognizer)
        }
    }
    //MARK:- Button Actions
    
    // Button action for the digits clicked in the custom number keyboard.
    @IBAction func buttonDigitPressed(sender: UIButton)
    {
        multiAppViewModel.buttonDigitPressed(sender: sender)
    }
    
    // Button action to show the details about the view controller.
    @IBAction func infoBtnAction(_ sender: UIButton) {
        
        alertPopOverView.isHidden = false
    }
    @IBAction func alertCloseBtnAction(_ sender: UIButton) {
        alertPopOverView.isHidden = true
    }
    // Button action to present the menu view controller.
    @IBAction func menuBtnAction(_ sender: UIButton) {
        multiAppViewModel.showMenuView()
    }
    @IBAction func homeButtonAction(_ sender: UIButton) {
        multiAppViewModel.homeButtonAction(sender: sender)
    }
    @IBAction func animationViewBtnAction(_ sender: UIButton) {
        animationView.isHidden = true
        timeForNewNumbers.invalidate()
        getNewNumbers()
    }
    
}
