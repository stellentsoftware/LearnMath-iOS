//
//  MultiSpeedDrillViewController.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/13/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//

import UIKit
import AudioToolbox
import Cheers


class MultiSpeedDrillViewController: UIViewController {
    
    //MARK:- Variable Declarations
    let APPDELEGATE = AppdelegateRef.appDelegate //Getting Appdelegate reference.
    var multidrillmodal:MultiSpeedDrillModel! // Initializing speed drill modal.
    var countStr:NSMutableAttributedString = NSMutableAttributedString() // This string is used for display the count text and questions count in different color.
    var timeStr:NSMutableAttributedString = NSMutableAttributedString() // This string is used for display the Time text and timer count in different color.
    
    var timer:Timer = Timer() //Timer is used for count down the drill time
   // var balloonTimer:Timer = Timer() //Timer is used for display the ballon animations
    var timeForNewNumbers:Timer = Timer() //Timer is used for calling the getting the new numbers.
    
    var imageSequencer1:Timer = Timer() //Timer is used for Display the cloud animation
    var imageSequencer2:Timer = Timer() //Timer is used for hide explosion animation.
    var imageSequencer3:Timer = Timer() //Timer is used for hide cloud animation.
    var imageSequencer4:Timer = Timer() //Timer is used for calling the getting the new numbers function after success or failure animation.

    var animationImagesArray:[UIImage] = [UIImage]() //This array is used for inserting the animaion images for displaying when success response
    
    var CountInt:Int = 0 // Used to assigning the questions count to the variable.
    var timeRemaining:Int = 0 // Used to assigning the timer countdown value to the variable.
    var timerMax:Int = 0 // Assigning the timer max value which is retrived from plist
    var equationFirstNum:Int = 0 //This is used for assigning the first random number
    var equationSecondNum:Int = 0 //This is used for assigning the second random number
    var inputPhase:Int = 0 //This variable is used in switch case
    var calculatedAnswer:Int = 0 //This variable is used for saving the caliculated answers
    var calcOnes:Int = 0 //This variable is used for save the caliculated answer one's position
    var calcTens:Int = 0 //This variable is used for save the caliculated answer ten's position
    var calcHuns:Int = 0 //This variable is used for save the caliculated answer hundred's position
    var calcThous:Int = 0 //This variable is used for save the caliculated answer thousand's position
    var mfLevel:Int = 0 // Retrive the Math level from plist and assign to the variable which is used to get the random numbers according to the level
    
    var mfRange:Int = 0 // Retrive the Math facts range from plist and assign to the variable which is used to get the random numbers with in this range
    
    var questionMax:Int = 0 //Getting maximum questions limit from plist and assigning to variable
    var questionCategory:Int = 0 //Variable used for which math operator is currently using.
    
    var mathOppStr:String! //This variable used to display the math operator in the equation
    
    var iconPlusSignLarge:UIImageView!   /// Math operator Image pointers "+"

    var iconMinusSignLarge:UIImageView! // Math operator Image pointers "-"

    var iconTimesSignLarge:UIImageView! // Math operator Image pointers "*"

    var iconDivideSignLarge:UIImageView! // Math operator Image pointers "÷"

    var iconCurrentSignLarge:UIImageView!
    var imageView:UIImageView! //??
    
    var explosionImage:UIImageView! //Displaying the explosion image when failure response
    var cloudImage:UIImageView! //Displaying the cloudImage image when failure response
    
    //MARK:- Outlet Connections
    @IBOutlet var popOverView: UIView! //Displaying the alert text in This View.
    @IBOutlet var answerLbl: UILabel! // Displaying equation answer for Addition ,Subtraction and Multiplication
    @IBOutlet var secondsLbl: UILabel! //Displaying the count down time and it is displayed right side above the numbers
    @IBOutlet var counterLbl: UILabel! //Displaying the number of questions answered and it is displayed left side above the numbers
    @IBOutlet var equationLbl: UILabel! // Display the numbers with math operator.
    @IBOutlet var divisionAnswerLbl: UILabel!//This label is displayed when the division operation is performed.When this label is displayed above the division symbol and displaying the division answers
    @IBOutlet weak var pageControl: UIPageControl!// Page Control to show the page number.
    @IBOutlet weak var headerView: UIView!// Header view.
    @IBOutlet var fluencyLbl: UILabel! // TitleLabel
    
    //MARK:- popoverViewsDeclaration
    @IBOutlet var popUpTitleView: UIView!//  In this displays the title and cross button in the popover view
    @IBOutlet var popUpmessageView: UIView! //In this View alert text is displayed.

    @IBOutlet var progressView: UIProgressView!//Progressbar is used to display the drill progress.and it is displayed above the numbers view
    @IBOutlet var divBox:UIImageView!// Division symbol is set when division operation is performed
    
    @IBOutlet var firstView: UIView! //In this view Numbers 1,2,3 are displaying
    @IBOutlet var secondView: UIView! //In this view Numbers 4,5,6 are displaying
    @IBOutlet var thirdView: UIView! //In this view Numbers 7,8,9 are displaying
    @IBOutlet var fourthView: UIView! //In this view Number 0 is displaying
    
    let cheerView = CheerView() // This View is used for displaying the animation images in success response.

    
    //MARK:- ViewLife Cycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configuration()// Method which is used to get the reference of 'view controller' into the 'view model' and vise versa.
        
        //Method which is used to load the intial designs.
        multidrillmodal.initialloading()
        
       
        let defaults = UserDefaults.standard
        if (defaults.string(forKey: "sound") == "On")
        {
        // Method which is used to get the reference of sound files from Sound fileobject
        AudioFilesConstant.kSoundFileObject.audioSoundsFilesData()
         } else {
        // Method which is used to remove the reference of sound files from Sound fileobject
            AudioFilesConstant.kSoundFileObject.disposeAudioSoundsFilesData()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
         timer.invalidate()
        
    }
    //Changing the frames according to the device
       override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        multidrillmodal.viewDidLayoutSubviews()
        cheerView.frame = view.bounds
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Methods
   
    func configuration(){
        multidrillmodal  = MultiSpeedDrillModel()
        multidrillmodal.multiDrillVCDelegate = self
    }
    //This function is used for disappearing the math operator icons after displaying while swiping up and down
     func fadeInAnimationFinished(animationID:String,finished:NSNumber,context:UnsafeMutableRawPointer){
        multidrillmodal.fadeInAnimationFinished(animationID: animationID, finished:finished, context: context)
    }
    //Timer Countdown function
    func countdown()
    {
        multidrillmodal.countdown()
    }
    //Cloud reveal animation function in failure response
    func cloudReveal()
    {
        cloudImage.isHidden = false;
        cloudImage.alpha = 1.0;
    }
    
    //ExplosionHide animation function in failure response
    func explosionHide()
    {
        UIView.beginAnimations("fade out cloud", context: nil)
        UIView.setAnimationDuration(1.35)
        explosionImage.alpha = 0.0;
        UIView.setAnimationCurve(.easeInOut)
        UIView.commitAnimations()
        progressView.progress = 0
    }
    //CloudHide animation function in failure response
    func cloudHide()
    {
        UIView.beginAnimations("fade out cloud", context: nil)
        UIView.setAnimationDuration(1.25)
        cloudImage.alpha = 0.0;
        UIView.setAnimationCurve(.easeInOut)
        UIView.commitAnimations()
        progressView.progress = 0
    }
    func successAnimationComplete()
    {
        progressView.progress = 0
    }
    //Getting new random numbers function
    func getNewNumbers()
    {
        multidrillmodal.getNewNumbers()
    }
    
    // MARK: - Swipe Methods
    func swipeLeft(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true
        {
        multidrillmodal.handleSwipeLeft(recognizer: recognizer)
        }
    }
    func swipeRight(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true
        {
        multidrillmodal.handleSwipeRight(recognizer: recognizer)
        }
    }
    func swipeUp(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true
        {
        multidrillmodal.handleSwipeUp(recognizer: recognizer)
        }
    }
    func swipeDown(recognizer:UISwipeGestureRecognizer)
    {
        if popOverView.isHidden == true
        {
        multidrillmodal.handleSwipeDown(recognizer: recognizer)
        }
    }
    //MARK:- Button Actions
    @IBAction func alertCloseBtnAction(sender: UIButton) {
        popOverView.isHidden = true
    }
    //Info button Action
    @IBAction func infoBtnAction(sender: UIButton) {
        
        multidrillmodal.showSpeedDrillInfo()
    }
    //Menu button Action
    @IBAction func menuBtnAction(sender: UIButton) {
        
        multidrillmodal.buttonMenuView()
    }
    @IBAction func homeButtonAction(_ sender: UIButton) {
        multidrillmodal.homeButtonAction(sender: sender)
    }
    //Action  performs when numbers are selected.
    @IBAction func buttonDigitPressed(sender: UIButton)
    {
        multidrillmodal.buttonDigitPressed(sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "speeddrill"
        {
            
        }
    }

}
