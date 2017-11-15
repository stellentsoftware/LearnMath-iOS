//
//  AppDelegate.swift
//  LearnMath
//
//  Created by varmabhupatiraju on 5/10/17.
//  Copyright © 2017 StellentSoft. All rights reserved.
//
//STARTED ON 10TH MAY 2017

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //getters and setters for  variables held on the appDelegate
    
    var MathFactsLevel: Int = 0 // To store the level data.
    var MathFactsRange: Int = 0 // To store the Numbers Range data.
    var MathFactsCatagory: Int = 0 // To store the Which category we are using.
    var MathFactsTimerMax: Int = 0 // To store the Max timer value.
    var MathFactsQuestionMax: Int = 0 // To store the Max Questions value.
     var islaunch: Bool = Bool() // Used for displaying the animation or not
    
    var MathFactsIsCurrent: Int = 0
    var Score: Int = 0 //Storing the number fo questions answered
    var Time: Int = 0 //Storing the time value
    
    var NumPairsArray = [[2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,6,6,6,6,7,7,7,8,8,9],  //First number
        [2,3,4,5,6,7,8,9,3,4,5,6,7,8,9,4,5,6,7,8,9,5,6,7,8,9,6,7,8,9,7,8,9,8,9,9],  //Second number
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],  //'Used' flag
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],  //Student score on this pair of numbers
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]] //Student's average time to answer this pair of numbers
    
    
    var arrayMax: Int = 36 // Size of the array
    
    var numAvailable: Int = 0 // Initial number of values that havent been seen in this 'round'
    var lastIndex: Int = 0  // The 'current' index  (the real 'index' get incremented too quickly)
    var countNumsProvided: Int = 0
    var countNumsTimed: Int = 1
    var slowestTime: Int = 0 // Placeholder for the sloewst time seen in the array
    var rangeMin: Int = 0
    var rangeMax: Int = 36
    
    //This is used to get the random number in between the selected range
    var RandomNumInRange: Int
    {
        switch MathFactsRange
        {
        case 0:
            rangeMin = 0
            rangeMax = 14
            break;
        case 1:
            rangeMin = 0
            rangeMax = 25
            break;
        case 2:
            rangeMin = 0
            rangeMax = 36
            break;
            //      case 3:
            //          rangeMin = 0
            //         rangeMax = 36
            //           break;
            
        default:
            print("AppDelegate: MathFactsRange out of bounds = \(MathFactsRange)")
            break;
        }
        var numAvailSeen:Int = 0 // Counter of 'available' (i.e. not used) numbers seen when looking through array for nth (where 'n' is random)
        if numAvailable < 1
        {
            for index in 0...arrayMax-1
            {
                // reset ENTIRE array for robustness
                NumPairsArray[2][index] = 0
            }
            numAvailable = rangeMax - rangeMin  // All values are initially available
        }
        countNumsProvided = countNumsProvided+1
        
        if (((countNumsTimed % 4) == 0) && (countNumsTimed > 11))
        {  // Every 4th request, provide a set of remedial nums: 'low' score or high time
            
            if ((countNumsTimed % 8) == 0)
            {  // if divisible by 8 we do a 'low' score question
                //for (index = rangeMin;  index < (rangeMax) ; index++)
                
                for index in rangeMin...rangeMax-1
                {  // Loop through usable range of array
                    
                    if (NumPairsArray[3][index] > 0)
                    {
                        // '0' is a perfect score...
                        NumPairsArray[3][index] = NumPairsArray[3][index] - 1
                        lastIndex = index               // Hold the index pointer for reference
                        return index
                    }
                }
                // if we don't have any remedials in the array we drop through to get new nums!
            }
                
            else {  // not divisible by 8 so we do a 'high time' question
                slowestTime = 0    // Reset slowest time
                // for (int index = rangeMin;  index < (rangeMax) ; index++)
                for index in rangeMin...rangeMax-1
                {  // Loop through usable range of array
                    if (NumPairsArray[4][index] > slowestTime)
                    {
                        slowestTime = NumPairsArray[4][index]
                        lastIndex = index              // Hold the index pointer for reference
                    }
                }
                return slowestTime
            } // Shouldn't get to here... There should always be a 'slowest' set of nums
        }
        var targetIndex: Int = 0
        targetIndex = Int(arc4random_uniform(UInt32(numAvailable)))
        // Get a random number within the range of still 'available' (unused) array entries
        //targetIndex = Int(arc4random_uniform(UInt32(numAvailable)))  // Don't want to divide by 0
        // for (int index = rangeMin;  index < (rangeMax) ; index++)
        
        for index in rangeMin...rangeMax-1
        {
            // Loop through usable range of array
            //  NSLog(@"AppDelegate: usedFlagFalse = %d", usedFlagFalse);
            
            if (NumPairsArray[2][index] == 0)
            {      // found an unused entry
                if (numAvailSeen == targetIndex)
                {   // Does it match our random number?
                    
                    numAvailable = numAvailable-1                  // One less available number
                    NumPairsArray[2][index] = 1     // Mark it as used
                    
                    lastIndex = index               // Hold the index pointer for reference
                    return index                    // We're done - return the index
                    
                } else {
                    numAvailSeen = numAvailSeen+1                 // It is available but not the one we are looking for
                }
            }
        }
        return -1
    }
    
    //Getting the random number
    var RandomNumFirstVal: Int
    {
        return NumPairsArray[0][lastIndex]
    }
    //Getting the random number
    var RandomNumSecondVal: Int
    {
        return NumPairsArray[1][lastIndex]
    }
    
    //This function is used for set the score i.e number of correct answers answered in the time limit in SpeedDril screen .
    func setScore(inScore:Int)
    {
        NumPairsArray[3][lastIndex] = NumPairsArray[3][lastIndex] + inScore
    }
    //This function is used for setting the time for SpeedDril. and we can set the time in menu screen (Drill Trimmer)
    func setTime(inTime:Int)
    {
        NumPairsArray[4][lastIndex] = (NumPairsArray[4][lastIndex] + inTime) / 2
        countNumsTimed = countNumsTimed+1
    }
    
    func resetArray()
    {
        for index in 0...arrayMax-1
        {
            NumPairsArray[2][index] = 0 // Reset 'used' flags
            NumPairsArray[3][index] = 0 // Reset 'error' values
            NumPairsArray[4][index] = 0 // Reset 'answer time' values
        }
        countNumsTimed = 0;
    }
    
    //This function is used for setting the "setMathFactsCatagory". We can set the category in the menu screen.
    func setMathFactsCatagory(newCatagory:Int)
    {
        MathFactsCatagory = newCatagory
        self.resetArray()
    }
    
    func mathFactsCatagory() -> Int
    {
        return MathFactsCatagory
    }
    
    //This function is used for setting the "MathFactsRange". We can set the range in the menu screen. This range is used for getting the random numbers in between the range.
    
    func SetMathFactsRange(newRange:Int)
    {
        MathFactsRange = newRange
        self.resetArray()
    }
    //  This function is used for getting the "MathFactsRange"
    
    func mathFactsRange() -> Int
    {
        return MathFactsRange
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
       // UIApplication.shared.setStatusBarHidden(false, with: .none)
        //Applying the statusbar background color
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.1725490196, blue: 0.2588235294, alpha: 1)
        islaunch = true
        //Checking the sound option is on or off .If there is no sound value in the user defaults, assigning default value as on.
        let defaults = UserDefaults.standard
        
        if (defaults.string(forKey: "sound") == nil)
        {
            defaults.set("On", forKey: "sound")
        }
      
        
        return true
    }
        func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

