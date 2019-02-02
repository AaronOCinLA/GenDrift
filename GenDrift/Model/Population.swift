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
    
    init(popSize: Int, numPop: Int, numGen: Int) {
        
        self.popSize = popSize
        self.numPop = numPop
        self.numGen = numGen
    }
    
    convenience init() {
        self.init(popSize: 0, numPop: 0, numGen: 0)
    }
    
    // MARK: - Methods
    func getData() -> [Int] {
        
        var tempArr = [Int](repeating: 0, count: 640)
        
        // Counters for each alele's
        var countA = 0
        var rateA = 0.5
        
        for j in 0...self.numGen {
            var rndNum = 0.0
            for _ in 0...self.popSize {
                rndNum = Double(arc4random()).truncatingRemainder(dividingBy: 1000)/1000    // Random number generater
                
                if rndNum < rateA { countA += 1 }
            }
            rateA = (Double(countA) / Double(self.popSize+1) )
            tempArr[j] = Int(rateA * 640) // + 20
            countA = 0
        }
        return tempArr
    }
}
