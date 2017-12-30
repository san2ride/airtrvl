//
//  AirportAPI.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class AirportAPI {

    let headers = [
        "content-type": "application/json",
        "accept": "application/json",
        "apc-auth": "a8740e2d7f",
        "apc-auth-secret": "06efdea5056580b",
        "cache-control": "no-cache",
        "postman-token": "aca04bf5-0a14-fd9b-5a38-2be24b24d7b3"
    ]
    
    func retrieveCode(_ searchedData: String) {
        
        let request = NSMutableURLRequest(url: URL(string: "https://www.air-port-codes.com/api/v1/single?iata=\(searchedData)")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                if let data = data {
                    do {
                        if let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject] {
                            print(dict)
                            if let airportDict = dict["airport"] as? JSONDictionary {
                                let airport = Airport(dict: airportDict)
                                print("Airport")
                                DispatchQueue.main.async (execute: {
                                    DataStore.sharedInstance.airportArray.append(airport)
                                })
                            }
                        }
                    } catch {
                        print("couldn't parse")
                    }
                }
            }
        })
        dataTask.resume()
    }
}
