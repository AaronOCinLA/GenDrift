//
//  Population.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 11/2/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation

public class Population {
    var popSize: Int
    var numPop: Int
    var numGen: Int
    var inputValues: [Int]
    var maxInputValues: [Int]
    var dblArr: [[Double]]
    var fixLossArr: [Int]
    
    init(_popSize: Int, _numPop: Int, _numGen: Int) {
        
        // Default initialization
        popSize = _popSize
        numPop = _numPop
        numGen = _numGen
        inputValues = [100, 10, 100]
        maxInputValues = [100, 10, 100]  //popSize, numPop, numBen
        dblArr = [[0.0],[0.0]]
        fixLossArr = [0,0]
    }
    
    //func countFixedAndLost() {
        // print("Fixed is: [\(fixLossArr[0]), \(fixLossArr[1])]")
    // }
}
