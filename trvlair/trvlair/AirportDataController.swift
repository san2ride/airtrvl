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
    
    var theAirport: Airport?
    var airportsArray = [Airport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Airport Data"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.airportNameLabel.text = theAirport?.name
        self.airportCityLabel.text = theAirport?.city
        self.airportElevationLabel.text = theAirport?.elevation
        self.airportWebsiteLabel.text = theAirport?.website
    
    }
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "MapSegue", sender: nil)
    }
}


