//
//  ViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 10/31/17.
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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var rewardLabel: UILabel!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var creatorField: UITextField!
    @IBOutlet weak var rewardField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    var cacheCount = 0
    var cacheArray = [GeoCache]()
    
    @IBAction func addGeoCache(_ sender: UIButton) {
        if ((titleField.text!).isEmpty || (detailsField.text!).isEmpty
            || (creatorField.text!).isEmpty || (rewardField.text!).isEmpty) {
            textField.text! = "Error: all of the above fields must be filled in"
        } else {
            let newString = titleField.text! + ": located at " + detailsField.text!
                + " with reward " + rewardField.text! + ". Created by "
                + creatorField.text!
            textField.text! = newString
            var dict = [String: String]()
            dict["title"] = titleField.text!
            dict["details"] = detailsField.text!
            dict["creator"] = creatorField.text!
            dict["reward"] = rewardField.text!
            let newCache = GeoCache(fromDictionary: dict)
            cacheArray.append(newCache!)
            saveCachesToDefaults(cacheArray)
            cacheCount += 1
        }
    }
    
    @IBAction func nextCache(_ sender: UIButton) {
        let user_cachearray = loadCachesFromDefaults()
        // Set text fields to be what is in the next geocache
        if (cacheCount == user_cachearray.count - 1) {
            cacheCount = 0
        } else {
            cacheCount = cacheCount + 1
        }
        let gc = user_cachearray[cacheCount]
        let dict = gc.dictionary
        titleField.text! = dict["title"]!
        detailsField.text! = dict["details"]!
        creatorField.text! = dict["creator"]!
        rewardField.text! = dict["reward"]!
    }
}

