//  Version2.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation
import UIKit

class Version2 : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var inputValues = Population(_popSize: 20, _numPop: 1, _numGen: 10)
    let _multiplier = [20,10]  // Constant multiliers for spinners, [population size,  number of generations]
    
    @IBOutlet weak var lblPopSize: UILabel!
    @IBOutlet weak var lblNumPop: UILabel!
    @IBOutlet weak var lblNumGen: UILabel!

    
    var pickerValues0: [Int] = [Int]()
    var pickerValues1: [Int] = [Int]()
    var pickerValues2: [Int] = [Int]()
    
    @IBOutlet weak var pickerPopSize: UIPickerView!
    @IBOutlet weak var pickerNumPop: UIPickerView!
    @IBOutlet weak var pickerNumGen: UIPickerView!
    
    @IBOutlet weak var btnSimulate: UIButton!
    
    // Timer
    var startTime = NSDate().timeIntervalSince1970
    var stopTime = NSDate().timeIntervalSince1970
    
    //X Axis lables
    @IBOutlet weak var lblXAxis0: UILabel!
    @IBOutlet weak var lblXAxis1: UILabel!
    @IBOutlet weak var lblXAxis2: UILabel!
    @IBOutlet weak var lblXAxis4: UILabel!
    @IBOutlet weak var lblXAxis3: UILabel!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Hide question label
        self.lblQuestion.text = ""
        
        // Connect data:
        self.pickerPopSize.delegate = self
        self.pickerPopSize.dataSource = self
        self.pickerNumPop.delegate = self
        self.pickerNumPop.dataSource = self
        self.pickerNumGen.delegate = self
        self.pickerNumGen.dataSource = self
        
        // Input array values
        //        pickerValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        pickerValues0 = Array(1...50)   // x20
        pickerValues1 = Array(1...20)
        pickerValues2 = Array(1...50)  // x10
        
        // Reset questions
        userTest.questionNum = -1
    }
    
    @IBAction func clickedBegin(_ sender: Any) {
        startTime = NSDate().timeIntervalSince1970
        userTest.questionNum = (userTest.questionNum + 1)%3
        
        startTime = NSDate().timeIntervalSince1970
        stopTime = NSDate().timeIntervalSince1970
        
        // Load question
        lblQuestion.text = userTest.arrQuestions[userTest.questionNum]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        removeSubView()
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView.tag == 0){
            return pickerValues0.count
        }
        else if (pickerView.tag == 1){
            return pickerValues1.count
        }
        else {  // (pickerView.tag == 2)
            return pickerValues2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView.tag == 0){
            inputValues.popSize = (pickerValues0[row]*_multiplier[0])
            updateLabels()
            return String(pickerValues0[row]*_multiplier[0])
        }
        else if (pickerView.tag == 1){
            return String(pickerValues1[row])
        }
        else{
            return String(pickerValues2[row]*_multiplier[1])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0){
            inputValues.popSize = (pickerValues0[row]*_multiplier[0])
        }
        else if (pickerView.tag == 1){
            inputValues.numPop = (pickerValues1[row]-1)
        }
        else{
            inputValues.numGen = (pickerValues2[row]*_multiplier[1])
        }
        
        updateLabels()
    }
    
    @IBAction func clickedSimulate(_ sender: Any) {
        
        // reset fixed/lost counter
        fixedLost = [0,0]
        
        // Set UI Version Number
        userTest.UIVersionNum = 2
        
        updateLabels()
        
        self.viewDidAppear(true)
        drawLines()
        
        // End timer get time value
        stopTime = NSDate().timeIntervalSince1970
        
        // Record timestamp
        userTest.timeStamp = (stopTime - startTime)
        
        // Resest Start Time
        startTime = NSDate().timeIntervalSince1970
    }
    
    func updateLabels() {
        
        glPopSize = Int(inputValues.popSize)
        glNumPop = Int(inputValues.numPop)
        glNumGen = Int(inputValues.numGen)
        
        lblPopSize.text = ("Population Size: " + String(glPopSize))
        lblNumPop.text = ("Number of Populations: " + String(glNumPop+1))
        lblNumGen.text = ("Number of Generations: " + String(glNumGen))
        
        // Add x-axis labels
        lblXAxis0.text = ("0")
        lblXAxis1.text = ("" + String(glNumGen/4))
        lblXAxis2.text = ("" + String(glNumGen/2))
        lblXAxis3.text = ("" + String(glNumGen/4*3))
        lblXAxis4.text = ("" + String(glNumGen))
    }
    
    func removeSubView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
    
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
    
}
