//
//  DataStore.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    override fileprivate init() {}
    
    var currentAirport = Airport()
    var airportArray = [Airport]()
    

}
