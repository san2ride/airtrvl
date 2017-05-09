//
//  AirportDataController.swift
//  trvlair
//
//  Created by don't touch me on 4/30/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportDataController: UITableViewController {
    
    
    var theAirport: Airport?
    var airportsArray = [Airport]()
    

    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return airportsArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! AirportDataCell
//        
//        self.theAirport = DataStore.sharedInstance.airportArray[(indexPath as NSIndexPath).row]
//        
//            cell.airportNameLabel.text = theAirport?.name
//            cell.airportCityLabel.text = theAirport?.city
//            cell.airportElevationLabel.text = theAirport?.elevation
//            cell.airportWebsiteLabel.text = theAirport?.website
//        
//        return cell
//        
//    }

    
}
