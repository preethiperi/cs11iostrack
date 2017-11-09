//
//  ViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 10/31/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cacheCount = 0
    var cacheArray = [GeoCache]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cacheArray = loadCachesFromDefaults()
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
    
    @IBAction func addGeoCache(_ sender: UIButton) {
        if ((titleField.text!).isEmpty || (detailsField.text!).isEmpty
            || (creatorField.text!).isEmpty || (rewardField.text!).isEmpty) {
            textField.text! = "Error: all of the above fields must be filled in"
        } else {
            var dict = [String: String]()
            dict["title"] = titleField.text!
            dict["details"] = detailsField.text!
            dict["creator"] = creatorField.text!
            dict["reward"] = rewardField.text!
            let newCache = GeoCache(fromDictionary: dict)
            cacheArray.append(newCache!)
            saveCachesToDefaults(cacheArray)
        }
    }
    
    @IBAction func nextCache(_ sender: UIButton) {
        // Set text fields to be what is in the next geocache
        if (cacheCount == cacheArray.count - 1) {
            cacheCount = 0
        } else {
            cacheCount = cacheCount + 1
        }
        let gc = cacheArray[cacheCount]
        let dict = gc.dictionary
        textField!.text = gc.description
    }
}

