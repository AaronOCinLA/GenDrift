//
//  Lines.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 11/2/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import UIKit

var glPopSize: Int = 80
var glNumPop: Int = 2
var glNumGen: Int = 200

let time = 2.0
let tlX = 770
let tlY = 640
let cgPointY = 354

// Todo: Add more colors and line variation
//       Add x and y axis labels

class DrawLines: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Array of colors for lines
    let arrColor = [UIColor.red.cgColor,
                    UIColor.blue.cgColor,
                    UIColor.green.cgColor,
                    UIColor.darkGray.cgColor,
                    UIColor.yellow.cgColor,
                    UIColor.purple.cgColor,
                    UIColor.orange.cgColor]
    
    var arrY = [Int](repeating: 0, count: tlY)
    
    // Drawing code
    override func draw(_ rect: CGRect) {
        
        
        var arrLines: [UIBezierPath] = [UIBezierPath]()
        
        for i in 0...glNumPop {
            arrLines.append(UIBezierPath())
            arrLines[i].move(to: CGPoint(x: 0, y:cgPointY))
        }
        
        // x coordinates for each line
        let xCord = (tlX / glNumGen + 1)
        
        // Double loop to fill each line for each population sample
        for i in 0...glNumPop {
            getData()
            for j in 1 ... glNumGen {
                arrLines[i].addLine(to: CGPoint(x: xCord * j, y:arrY[j]))
            }
        }
        
        // Testing section
        // All fixate
        var percentFixed = 0.00
        percentFixed = (Double(fixedLost[0] + fixedLost[1])/Double(glNumPop+1))

        // Check answers
        userTest.checkAnsewrs(rate: percentFixed)
        
        
        // Create array of CAShape Layer
        var arrPathLayers: [CAShapeLayer] = [CAShapeLayer]()
        var arrPathAnimations: [CABasicAnimation] = [CABasicAnimation]()
        
        for i in 0...glNumPop {
            
            arrPathLayers.append(CAShapeLayer())
            arrPathLayers[i].frame = bounds
            arrPathLayers[i].path = arrLines[i].cgPath
            arrPathLayers[i].strokeColor = arrColor[i%(arrColor.count)]
            arrPathLayers[i].fillColor = nil
            arrPathLayers[i].lineWidth = 2.0
            arrPathLayers[i].lineJoin = CAShapeLayerLineJoin.bevel
            
            // Add layer to views layer
            layer.addSublayer(arrPathLayers[i])
            
            // Basic Animation
            arrPathAnimations.append(CABasicAnimation(keyPath: "strokeEnd"))
            arrPathAnimations[i].duration = time  //Length of time
            arrPathAnimations[i].fromValue = NSNumber(value: 0.0)
            arrPathAnimations[i].toValue = NSNumber(value:1.0)
            
            // Add Animation
            arrPathLayers[i].add(arrPathAnimations[i], forKey: "strokeEnd")
        }
    }
    
    func getData() {
        
        // Counters for each alele's
        var countA = 0
        var rateA = 0.5
        
        for j in 0...glNumGen {
            var rndNum = 0.0
            for _ in 0...glPopSize {
                rndNum = Double(arc4random()).truncatingRemainder(dividingBy: 1000)/1000    // Random number generater
                
                if rndNum < rateA { countA += 1 }
            }
            rateA = (Double(countA) / Double(glPopSize+1) )
            arrY[j] = Int(rateA * 640) + 20
            countA = 0
        }
        
        

        if (arrY[glNumGen] == 660) {
            fixedLost[1] = fixedLost[1] + 1
        }
        else if (arrY[glNumGen] == 20) {
            fixedLost[0] = fixedLost[0] + 1
        }
    }
}
