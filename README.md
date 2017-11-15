 ### Learn Math ###
 

 ==================================================================

### DESCRIPTION: ###

    Learn Math is a perfect app for the students of age 6 to 12. 
    It’s all about to improve the mathematics ability of students. 
    This app provides fun kind of environment for the students to learn the mathematics in an easy way.

    Students can easily learn addition, subtraction, multiplication and division by using this application. 
    LearnMath application is also useful app for teachers and parents to teach their students and children to learn 
    the mathematics in a prominent way.



 ==================================================================

### BUILD REQUIREMENTS: ###

    Xcode 8.2, iOS SDK 10.0 or later
 
 ==================================================================
 
 ### PROJECT ARCHITECTURE: ###
    MVVM(ModelView View Model) architecture.
 
 ==================================================================
 
 ### Frameworks: ###
    Foundation,
    UIKit,
    QuartzCore,
    AudioToolbox.

===================================================================

### RUNTIME REQUIREMENTS: ###

    iPhone in portrait mode running iOS 10.0 or better

 ==================================================================

### PACKAGING LIST: ###


    Appdelegate:-
 
       A UIApplication delegate class that will set the range of the numbers, level, arithmetic operation category 
       and the first and second random numbers.
    

    MathfactsViewController:-
        
        A UIViewController that displays the operands for the basic arithmetic operations.
        Contains an action method "info" which is used to give the information about the current Viewcontroller.
        Contains an action method "menu" which is used to display the options.
        Also display different categories while swipe up/down. Give the alert sound according to the selected answer.


    MultiAppViewController:-

       + A UIViewController that displays the operands for arithmetic operations 
        according to the selected category level in menu option.
       + Contains an action method "info" which is used to give the information about the current Viewcontroller.
       + Contains an action method "menu" which is used to display the options.
       + Also display different categories while swipe up/down. Give the alert sound according to the selected answer.


    SpeedDrillViewController:-

        + A UIViewController that having a view which displays the timer and the question count 
        which was selected in menu. Also displaying a progressview when the drill is stared.

        + Contains an action method "info" which is used to give the information about the current Viewcontroller.
        + Contains an action method "menu" which is used to display the options.
        + Also display different categories while swipe up/down.


    LongDivisionViewController:-

        + A UIViewController that is used to display the division operation for both long and small divisions.

        + Contains an action method "info" which is used to give the information about the current Viewcontroller.
        + Contains an action method "menu" which is used to display the options.
        + Also display different categories while swipe up/down.

    MenuViewController:-

        + A UIViewController that having the options list which are used to select the range,
        level, category, timer value and the questions count.

        Contains an action method "info" which is used to give the information about the current Viewcontroller.

        Contains an action method "Done" which is used to redirect to the initial screen.

    Main.storyboard

        Interface Builder file that defines the iPhone interface for the application. 


    Info.plist

        The scheme file for the settings bundle.

 ==================================================================


 ==================================================================

 Copyright (C)  StellentSoft(Mybusinessapp Inc.) All rights reserved.
