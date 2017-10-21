//
//  ViewController.swift
//  CS11
//
//  Created by Preethi Periyakoil on 10/21/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Properties
    @IBOutlet weak var textFieldLeft: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFieldRight: UITextField!
    
    //MARK: Actions
    
    @IBAction func sendLeft(_ sender: UIButton) {
        let leftText = textFieldLeft.text!;
        let newText = label.text! + leftText;
        label.text = newText;
    }
    
    @IBAction func sendRight(_ sender: UIButton) {
        let rightText = textFieldRight.text!;
        let newText = label.text! + rightText;
        label.text = newText;
    }
    @IBAction func clearLabel(_ sender: UIButton) {
        label.text = "";
    }
    
    /*
    @IBAction func clearVowels(_ sender: UIButton) {
        for char in label.text! {
            if (char == "a" || char == "e" || char == "i"
                            || char == "o" || char == "u") {
                let char = "";
            }
        }
    }
 */
}

