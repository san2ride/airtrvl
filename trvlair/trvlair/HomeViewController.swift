//
//  HomeViewController.swift
//  trvlair
//
//  Created by don't touch me on 4/29/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var iataCodeField: UITextField!
    
    var airportAPI = AirportAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Destination"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Clear first responder
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        iataCodeField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let destination = iataCodeField.text {
            airportAPI.retrieveCode(destination)
        }
    }
}
