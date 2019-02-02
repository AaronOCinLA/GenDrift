//  Version1.swift
//  GenDrift
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import Foundation
import UIKit


class MainViewController : UIViewController {
    
    var inputValues = Population(popSize: 500, numPop: 10, numGen: 300)
    
    @IBOutlet weak var lblPopSize: UILabel!
    @IBOutlet weak var lblNumPop: UILabel!
    @IBOutlet weak var lblNumGen: UILabel!
    @IBOutlet weak var viewMain: DrawLinesView!
    
    // Object variables
    @IBOutlet weak var sliderPopSize: UISlider!
    @IBOutlet weak var sliderNumPop: UISlider!
    @IBOutlet weak var sliderNumGen: UISlider!
    @IBOutlet weak var btnSimulate: UIButton!
    
    
    
    // MARK: - Viewcontroller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMain.isHidden = true
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 99, green: 181, blue: 229)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        removeSubView()
    }
    
    // MARK: - Methods
    
    @IBAction func clickedSimulate(_ sender: UIButton) {
        
        inputValues.popSize = Int(sliderPopSize.value)
        inputValues.numPop = Int(sliderNumPop.value)
        inputValues.numGen = Int(sliderNumGen.value)
        
        self.viewMain.drawShape(currentData: inputValues)
    }
    
    @IBAction func updateSliderValue(_ sender: UISlider) {
        updateLabels()
    }
    
    func updateLabels() {
        
        lblPopSize.text = ("Population Size: " + String(Int(sliderPopSize.value)))
        lblNumPop.text = ("Number of Populations: " + String(Int(sliderNumPop.value-1)))
        lblNumGen.text = ("Number of Generations: " + String(Int(sliderNumGen.value)))
    }
    
    func removeSubView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
}
