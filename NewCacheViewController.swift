//
//  ViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 10/31/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class NewCacheViewController: UIViewController {
    
    var dict = [String: String]()
    var cache : GeoCache? = nil
    
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
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        if (cache != nil) {
            cache = nil
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare was reached")
        var dict = [String: Any]()
        if let value : String = titleField.text, !value.isEmpty {
            dict["title"] = titleField.text!
        }
        
        if let value : String = detailsField.text, !value.isEmpty {
            dict["details"] = detailsField.text!
        }
        
        if let value : String = creatorField.text, !value.isEmpty {
            dict["creator"] = creatorField.text!
        }
        
        if let value : String = rewardField.text, !value.isEmpty {
            dict["reward"] = rewardField.text!
        }
        
        dict["id"] = randomCacheId()

        if let tempcache : GeoCache = GeoCache(fromDictionary: dict) {
            cache = tempcache
        } else {
            print("could not create cache")
        }
    }
}
