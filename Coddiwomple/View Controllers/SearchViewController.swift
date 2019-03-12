//
//  ViewController.swift
//  Coddiwomple
//
//  Created by Brian Sakhuja on 1/10/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import CoreLocation
import CDYelpFusionKit

class SearchViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Constants and variables
    let yelpAPIClient = CDYelpAPIClient(apiKey: apiKey)
    var businessResults = [CDYelpBusiness]()
    
    // Declare instance variables here
    let locationManager = CLLocationManager()
    var coordinateLocation: CLLocationCoordinate2D?
    
    
    // IBOutlets
    @IBOutlet weak var placeSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        placeSearchBar.delegate = self
        
        // Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        // Set the tapGesture here to ultimately dismiss keyboard when user taps tableview
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableView.addGestureRecognizer(tapGesture)
    }
    
    // UITableView delegate and data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = businessResults[indexPath.row].name!
        return cell
    }

    // UISearchBar delegate method
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchBarText = searchBar.text {
            searchYelp(searchQuery: searchBarText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    // Declare tableViewTapped here:
    @objc func tableViewTapped() {
        placeSearchBar.endEditing(true)
    }
    
    
    //MARK: - Networking
    /***************************************************************/
    func searchYelp(searchQuery: String) {
        let doubleLatitude = Double((self.coordinateLocation?.latitude)!)
        let doubleLongitude = Double((self.coordinateLocation?.longitude)!)
        
        yelpAPIClient.cancelAllPendingAPIRequests()
        
        yelpAPIClient.searchBusinesses(byTerm: searchQuery,
                                       location: nil,
                                       latitude: doubleLatitude,
                                       longitude: doubleLongitude,
                                       radius: 10000,
                                       categories: nil,
                                       locale: .english_unitedStates,
                                       limit: 20,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: nil,
                                       openNow: false,
                                       openAt: nil,
                                       attributes: nil) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            
                                            self.businessResults = businesses
                                            self.tableView.reloadData()
                                        }
                        
                                        
        }
        
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    func updateSearchResultsFromYelp(json: JSON) {
        
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    func updateUIWithSearchResultsFromYelp() {
        
    }
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    // Write the didUpdateLocations method here:
    // Gets the user's current location and updates the coordinateLocation property
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            print("Latitude: \(location.coordinate.latitude); Longitude: \(location.coordinate.longitude)")
        
            self.coordinateLocation = location.coordinate
        
        }
    }
    
    //Write the didFailWithError method here:
    // TODO: - Handle the error more elegantly
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
    }
    
    
    
}
