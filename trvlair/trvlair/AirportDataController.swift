//
//  AirportDataController.swift
//  trvlair
//
//  Created by don't touch me on 4/30/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportDataController: UITableViewController {
    
    @IBOutlet var airportNameLabel: UILabel!
    @IBOutlet var airportCityLabel: UILabel!
    @IBOutlet var airportElevationLabel: UILabel!
    @IBOutlet var airportWebsiteLabel: UILabel!
    
    let airportAPI = AirportAPI()
    var theAirport: Airport?
    var airportsArray = [Airport]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.airportNameLabel.text = theAirport?.name
        self.airportCityLabel.text = theAirport?.city
        self.airportElevationLabel.text = theAirport?.elevation
        self.airportWebsiteLabel.text = theAirport?.website
    
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return airportsArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! AirportDataCell
//
//        self.theAirport = DataStore.sharedInstance.airportArray[(indexPath as NSIndexPath).row]
//
//            cell.airportNameLabel.text = theAirport?.name
//            cell.airportCityLabel.text = theAirport?.city
//            cell.airportElevationLabel.text = theAirport?.elevation
//            cell.airportWebsiteLabel.text = theAirport?.website
//
//            return cell
//    }
}



//            switch indexPath.section {
//            case 0:
//                airportNameLabel.text = theAirport?.name
//            case 1:
//                airportCityLabel.text = theAirport?.city
//            case 2:
//                airportElevationLabel.text = theAirport?.elevation
//            case 3:
//                airportWebsiteLabel.text = theAirport?.website
//            default:
//                break
//            }

