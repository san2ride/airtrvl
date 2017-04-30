//
//  Airport.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class Airport: NSObject {
    
    var name:      String = ""
    var city:      String = ""
    var iata:      String = ""
    var elevation: String = ""
    var website:   String = ""
    var latitude:  String = ""
    var longitude: String = ""
    
    override init() {
        super.init()
    }
    
    init(dict: JSONDictionary) {
        super.init()
        
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("I could not parse the name")
        }
        
        if let city = dict["city"] as? String {
            self.city = city
        } else {
            print("I could not parse the icon")
        }
        
        if let iata = dict["iata"] as? String {
            self.iata = iata
        } else {
            print("I could not parse the iata")
        }
        
        if let elevation = dict["elevation"] as? String {
            self.elevation = elevation
        } else {
            print("I could not parse the iata")
        }
        
        if let website = dict["website"] as? String {
            self.website = website
        } else {
            print("I could not parse the iata")
        }
        
        if let latitude = dict["latitude"] as? String {
            self.latitude = latitude
        } else {
            print("I could not parse the latitude")
        }
        
        if let longitude = dict["longitude"] as? String {
            self.longitude = longitude
            print(longitude)
        } else {
            print("I could not parse the longitude")
        }
        
    }

}
