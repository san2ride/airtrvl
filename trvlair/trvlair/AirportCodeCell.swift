//
//  AirportCodeCell.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportCodeCell: UITableViewCell {

    @IBOutlet var airportNameLabel: UILabel!
    @IBOutlet var airportCodeLabel: UILabel!
    
    internal func configureCell(airport: Airport) {
        airportNameLabel.text = airport.name
        airportCodeLabel.text = airport.iata
    }

}
