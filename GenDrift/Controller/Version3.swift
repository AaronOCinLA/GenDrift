//  Version3.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation
import UIKit

class Version3 : UIViewController {
    
    var inputValues = Population(_popSize: 500, _numPop: 10, _numGen: 300)
    
    @IBOutlet weak var lblPopSize: UILabel!
    @IBOutlet weak var lblNumPop: UILabel!
    @IBOutlet weak var lblNumGen: UILabel!
    @IBOutlet weak var txtPopSize: UITextField!
    @IBOutlet weak var txtNumPop: UITextField!
    @IBOutlet weak var txtNumGen: UITextField!
    @IBOutlet weak var btnSimulate: UIButton!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    //X Axis lables
    @IBOutlet weak var lblXAxis0: UILabel!
    @IBOutlet weak var lblXAxis1: UILabel!
    @IBOutlet weak var lblXAxis2: UILabel!
    @IBOutlet weak var lblXAxis4: UILabel!
    @IBOutlet weak var lblXAxis3: UILabel!
    
    // Timer
    var startTime = NSDate().timeIntervalSince1970
    var stopTime = NSDate().timeIntervalSince1970
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Hide question label
        self.lblQuestion.text = ""
        
        // Update suggested values
        self.txtPopSize.placeholder = "10 to 1000"
        self.txtNumPop.placeholder = "1 to 20"
        self.txtNumGen.placeholder = "10 to 600"
        
        // updateLabels()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func clickedBegin(_ sender: Any) {
        startTime = NSDate().timeIntervalSince1970
        userTest.questionNum = (userTest.questionNum + 1)%3
        
        startTime = NSDate().timeIntervalSince1970
        stopTime = NSDate().timeIntervalSince1970
        
        // Load question
        lblQuestion.text = userTest.arrQuestions[userTest.questionNum]
    }
    
    @IBAction func clickedSimulate(_ sender: Any) {
        
        // reset fixed/lost counter
        fixedLost = [0,0]
        
        // Set UI Version Number
        userTest.UIVersionNum = 3
        
        updateLabels()
        resignFirstResponder()
        self.viewDidAppear(true)
        drawLines()
        
        // select outside text box
        
        // End timer get time value
        stopTime = NSDate().timeIntervalSince1970
        
        // Record timestamp
        userTest.timeStamp = (stopTime - startTime)
        
        // Resest Start Time
        startTime = NSDate().timeIntervalSince1970
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        removeSubView()
    }
    
    func updateLabels() {
        
        // checkErrors()
        
        glPopSize = Int(txtPopSize.text!)!
        glNumPop = Int(txtNumPop.text!)!
        glNumGen = Int(txtNumGen.text!)!
        
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
    
    func checkErrors() {
        
        //      glPopSize = Int(txtPopSize.text!)!
        //       glNumPop = Int(txtNumPop.text!)!
        //      glNumGen = Int(txtNumGen.text!)!
        
//        if (Int(txtPopSize.text!)!)
//        print("Please enter a value between \(val) for the \(field)")
//        
//        // create the alert
//        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
//        
//        // add an action (button)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        
//        // show the alert
//        self.present(alert, animated: true, completion: nil)
    }
    
}

