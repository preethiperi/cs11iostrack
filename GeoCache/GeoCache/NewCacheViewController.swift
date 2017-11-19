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
        var dict = [String: String]()
        dict["title"] = titleField.text!
        dict["details"] = detailsField.text!
        dict["creator"] = creatorField.text!
        dict["reward"] = rewardField.text!
        cache = GeoCache(fromDictionary: dict)
    }
}

