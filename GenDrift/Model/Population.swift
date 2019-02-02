//
//  Population.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 11/2/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import UIKit

public class Population {
    var popSize: Int
    var numPop: Int
    var numGen: Int
    var dblArr: [[Double]]
    var fixLossArr: [Int]
    
    init(popSize: Int, numPop: Int, numGen: Int) {
        
        // Default initialization
        self.popSize = popSize
        self.numPop = numPop
        self.numGen = numGen
        self.dblArr = [[0.0],[0.0]]
        self.fixLossArr = [0,0]
    }
    
    convenience init() {
        self.init(popSize: 0, numPop: 0, numGen: 0)
    }
}
