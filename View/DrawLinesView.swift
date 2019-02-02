//
//  Lines.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 11/2/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import UIKit

class DrawLinesView: UIView {
    
    var userEntry = Population()
    
    let time = 2.0
    let tlX = 770
    let tlY = 640
    let cgPointY = 354
    
    // Array of colors for lines
    let arrColor = [UIColor.red.cgColor,
                    UIColor.blue.cgColor,
                    UIColor.green.cgColor,
                    UIColor.darkGray.cgColor,
                    UIColor.yellow.cgColor,
                    UIColor.purple.cgColor,
                    UIColor.orange.cgColor]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Methods
    
    func drawShape(currentData: Population) {
        userEntry = currentData
        setNeedsDisplay()
    }
    
    private func drawLines(user context: CGContext) {
        
        layer.sublayers = nil
        
        var arrLines: [UIBezierPath] = [UIBezierPath]()
        
        for i in 0...userEntry.numGen {
            arrLines.append(UIBezierPath())
            arrLines[i].move(to: CGPoint(x: 0, y:cgPointY))
        }
        
        // x coordinates for each line
        let xCord = (tlX / userEntry.numGen + 1)
        
        // Move to get Data - Double loop to fill each line for each population sample
        for i in 0...userEntry.numGen {
            let arrY = userEntry.getData()
            for j in 1 ... userEntry.numGen {
                arrLines[i].addLine(to: CGPoint(x: xCord * j, y: arrY[j]))
            }
        }
        
        // Create array of CAShape Layer
        var arrPathLayers: [CAShapeLayer] = [CAShapeLayer]()
        var arrPathAnimations: [CABasicAnimation] = [CABasicAnimation]()
        
        for i in 0...userEntry.numPop {
            
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
            
            layer.isHidden = false
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        if userEntry.numGen > 0  {
            drawLines(user: currentContext)
        }
    }
}
