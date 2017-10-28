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
        let leftText = textFieldLeft.text!
        let newText = label.text! + leftText.lowercased()
        label.text = newText
    }
    
    @IBAction func sendRight(_ sender: UIButton) {
        let rightText = textFieldRight.text!
        let newText = label.text! + rightText.uppercased()
        label.text = newText
    }
    @IBAction func clearLabel(_ sender: UIButton) {
        label.text = ""
    }

    @IBAction func clearVowels(_ sender: UIButton) {
        let char_array = Array(label.text!)
        var output_text = ""
        for char in char_array {
            let lower_char = Character(String(char).lowercased())
            if !(lower_char == "a" ||
                lower_char == "e" ||
                lower_char == "i" ||
                lower_char == "o" ||
                lower_char == "u") {
                output_text += String(char)
            }
        }
        label.text = output_text
    }
}

