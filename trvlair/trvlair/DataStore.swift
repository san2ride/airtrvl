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
    
    
//    func createAirport() -> Airport {
//        let newAirport = Airport(dict: JSONDictionary)
//        
//        airportArray.append(newAirport)
//        
//        return newAirport
//    }
    
    func removeAirport(airport: Airport) {
        if let index = airportArray.index(of: airport) {
            airportArray.remove(at: index)
        }
    }
    
    func moveAiportAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can re-insert it
        let movedAirport = airportArray[fromIndex]
        
        // Remove airport from array
        airportArray.remove(at: fromIndex)
        
        // Insert airport in array at new location
        airportArray.insert(movedAirport, at: toIndex)
        
    }
}
