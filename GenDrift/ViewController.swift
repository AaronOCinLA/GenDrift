//
//  ViewController.swift
//  GenDrift
//
//  Created by Aaron O'Connor on 10/26/18.
//  Copyright © 2018 Digital Dingo. All rights reserved.
//

import UIKit

var fixedLost = [0,0]
var userTest = Test()

class ViewController: UIViewController {
    
    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var Label: UILabel!
    
    
    var varView = Int()
    
    // var userTest = Test()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if (varView == 0) {
            Label.text = "Strings"
        }
        else {
            Label.text = "Others"
        }
        
    }
}

