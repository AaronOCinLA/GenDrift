//
//  Test.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 12/2/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation

var fixationRate = 0.0
var timeForCorrect = 0.0

public class Test {
    
    let arrQuestions:  [String]
    var UIVersionNum: Int
    var questionNum: Int
    var timeStamp: Double
    var counter: Int
    var testLog: [String]
    
    
    init() {
        arrQuestions = ["Question 1: Create an example where the majority of the allele's either fixate or are lost",
                        "Question 2: Create an example where few, if any alleles fixate or are lost",
                        "Question 3: Create an example where about half of the alleles fixate or are lost"]
        UIVersionNum = -1
        questionNum = -1
        timeStamp = 0.0
        counter = -1
        testLog = []
    }
    
    func checkAnsewrs(rate: Double) {
        
        if (rate > 0.75) {
            if questionNum == 0 {
                printToLog(_rate: rate)
            }
           
        }
        else if (rate > 0.25) {
            if questionNum == 2 {
                printToLog(_rate: rate)
            }
        }
        else if (rate <= 0.25) {
            if questionNum == 1 {
                printToLog(_rate: rate)
            }
        }
        
    }
    
    func printToLog(_rate: Double){
        print("UIVersion: \tQuestionNum: \tRate: \tTime: ")
        print("---------- \t------------ \t----- \t----")
        // print("\(UIVersionNum) \t\(questionNum + 1) \t\(_rate.toHundredth) \t\(timeStamp.toMiliSeconds)")
        testLog.append(("\(UIVersionNum) \t\(questionNum + 1) \t\(_rate.toHundredth) \t\(timeStamp.toMiliSeconds)"))
        for i in 0...testLog.count - 1 {
            print(testLog[i])
        }
        timeForCorrect = Double(timeStamp.toMiliSeconds)!
    
    }
}

extension Double {
    var toHundredth: String {
        return String(format: "%.2f", self)
    }
    var toMiliSeconds: String {
        return String(format: "%.3f", self)
    }
}
