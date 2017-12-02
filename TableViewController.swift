//
//  TableViewController.swift
//  GeoCache
//
//  Created by Preethi Periyakoil on 11/11/17.
//  Copyright © 2017 Preethi Periyakoil. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var cacheArray = [GeoCache]()
    
    func closure (_ gcArray: [GeoCache]) {
        cacheArray = gcArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCachesFromServer(onComplete: closure)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cacheArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "basicCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        let gc = cacheArray[indexPath.row]
        
        cell.textLabel?.text = gc.title

        return cell
    }
    
    @IBAction func unwindToTable(sender: UIStoryboardSegue) {
        if ((sender.source as? NewCacheViewController) != nil) {
            var controller : NewCacheViewController = sender.source as! NewCacheViewController
            if (controller.cache != nil) {
                cacheArray.append(controller.cache!)
                let ip = IndexPath(row: cacheArray.count, section: 0)
                tableView.insertRows(at: [ip], with: UITableViewRowAnimation.fade)
                saveCachesToDefaults(cacheArray)
                // sendCacheToServer(controller.cache!)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDetail", sender: indexPath)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ToDetail") {
            let row = (sender as? IndexPath)?.row
            var dest : DetailViewController = segue.destination as! DetailViewController
            if ((dest as? DetailViewController) != nil) {
                let array_row = row as? Int
                dest.gc_description = cacheArray[array_row!].description
            }
        }
    }
    

}
