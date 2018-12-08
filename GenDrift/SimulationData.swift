//
//  SimulationData.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 11/9/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import UIKit

class SimulationData {
    
    let popSize: Int
    let numPop: Int
    let numGen: Int
    
    init(_popSize: Int, _numPop: Int, _numGen: Int) {
        popSize = _popSize
        numPop = _numPop
        numGen = _numGen
    }
}
