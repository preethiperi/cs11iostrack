//
//  DetailViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 11/18/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var gc_description : String? = String();

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gc_description! = "";
        // Do any additional setup after loading the view.
        textView.text = gc_description!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
