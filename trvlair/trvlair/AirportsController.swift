//
//  AirportsController.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportsController: UITableViewController {
    
    let kAirport = "kAirport"
    var currentAirport: Airport?
    var airportsArray = [Airport]()
    
    // Adding Edit button
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.rightBarButtonItem = editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.airportsArray = DataStore.sharedInstance.airportArray
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return airportsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AirportCodeCell
        
        self.currentAirport = DataStore.sharedInstance.airportArray[indexPath.row]
        
        cell.airportNameLabel.text = currentAirport?.name
        cell.airportCodeLabel.text = currentAirport?.iata

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete a command...
        if editingStyle == .delete {
            let airport = DataStore.sharedInstance.airportArray[indexPath.row]
            
            let title = "Delete \(airport.name)?"
            let message = "Are you sure you want to delete this Airport?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            
                // Remove the item from the DataStore
                DataStore.sharedInstance.removeAirport(airport: airport)
                
                // Also remove that row from the tableview with animation
                self.tableView.deleteRows(at: [indexPath], with: .fade)

            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.currentAirport = self.airportsArray[(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: "AirportDataSegue", sender: nil)
    }
    

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        DataStore.sharedInstance.moveAiportAtIndex(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as? AirportDataController
        
        controller?.theAirport = self.currentAirport
    }
    
    
    
    
}
