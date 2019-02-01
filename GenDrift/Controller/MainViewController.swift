//  Version1.swift
//  GenDrift
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation
import UIKit


class MainViewController : UIViewController {
    
    
    
    var inputValues = Population(_popSize: 500, _numPop: 10, _numGen: 300)
    
    @IBOutlet weak var lblPopSize: UILabel!
    @IBOutlet weak var lblNumPop: UILabel!
    @IBOutlet weak var lblNumGen: UILabel!
    @IBOutlet weak var btnBegin: UIButton!
    @IBOutlet weak var viewMain: DrawLines!
    
    // Object variables
    @IBOutlet weak var sliderPopSize: UISlider!
    @IBOutlet weak var sliderNumPop: UISlider!
    @IBOutlet weak var sliderNumGen: UISlider!
    @IBOutlet weak var btnSimulate: UIButton!
    
    //X Axis lables
    @IBOutlet weak var lblXAxis0: UILabel!
    @IBOutlet weak var lblXAxis1: UILabel!
    @IBOutlet weak var lblXAxis2: UILabel!
    @IBOutlet weak var lblXAxis4: UILabel!
    @IBOutlet weak var lblXAxis3: UILabel!
    
    
    // Timer
    var startTime = NSDate().timeIntervalSince1970
    var stopTime = NSDate().timeIntervalSince1970
    
    // Question Label
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBAction func clickedBegin(_ sender: Any) {
        userTest.questionNum = (userTest.questionNum + 1)%3

        startTime = NSDate().timeIntervalSince1970
        stopTime = NSDate().timeIntervalSince1970
        
        // Load question
        lblQuestion.text = userTest.arrQuestions[userTest.questionNum]
    }
    

    
    @IBAction func clickedSimulate(_ sender: UIButton) {
        
        // reset fixed/lost counter
        fixedLost = [0,0]
        
        // Set UI Version Number
        userTest.UIVersionNum = 1
        
        
        updateLabels()
        self.viewDidAppear(true)
        
        // drawLines()
        drawLines()
        
        // End timer get time value
        stopTime = NSDate().timeIntervalSince1970
        
        // Record timestamp
        userTest.timeStamp = (stopTime - startTime)
        
        // Resest Start Time
        startTime = NSDate().timeIntervalSince1970
    }
    
    @IBAction func updateSliderValue(_ sender: UISlider) {
        inputValues.inputValues[sender.tag] = Int(sender.value)
        updateLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        removeSubView()
    }
    
    override func viewDidLoad() {
      
        
    }
    
    // MARK: - Methods
    
    func drawLines() {
        // Draws lines
        
        let width: CGFloat = 770.0
        let height: CGFloat = 680.0
        
        let dl = DrawLines(frame: CGRect(x: 234,
                                         y: 68,
                                         width: width,
                                         height: height))
        dl.tag = 100
        self.view.addSubview(dl)
    }
    
    func updateLabels() {
        
        // Add x-axis labels
        lblXAxis0.text = ("0")
        lblXAxis1.text = ("" + String(glNumGen/4))
        lblXAxis2.text = ("" + String(glNumGen/2))
        lblXAxis3.text = ("" + String(glNumGen/4*3))
        lblXAxis4.text = ("" + String(glNumGen))
        
        
        glPopSize = Int(sliderPopSize.value)
        glNumPop = Int(sliderNumPop.value)-1
        glNumGen = Int(sliderNumGen.value)
        
        lblPopSize.text = ("Population Size: " + String(glPopSize))
        lblNumPop.text = ("Number of Populations: " + String(glNumPop+1))
        lblNumGen.text = ("Number of Generations: " + String(glNumGen))
    }
    
    func removeSubView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    func alert() {
        // the alert view
        let alert = UIAlertController(title: "", message: "alert disappears after 2 seconds", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
