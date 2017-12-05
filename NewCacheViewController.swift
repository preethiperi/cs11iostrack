//
//  ViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 10/31/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class NewCacheViewController: UIViewController, UIImagePickerControllerDelegate {
    
    var dict = [String: String]()
    var cache : GeoCache? = nil
    var picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
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
        cache!.image = imageView?.image
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraButton(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let selectedimage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView?.image = selectedimage
            imageView?.contentMode = .scaleAspectFit
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

