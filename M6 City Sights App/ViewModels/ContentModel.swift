//
//  ContentModel.swift
//  M6 City Sights App
//
//  Created by Xinyue Hu on 10/29/22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    override init() {
        // Init method of NSObject
        super.init()
        //set content moel as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
        
        
        // start geolocating the user
        // locationManager.startUpdatingLocation()
    }
    
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            // we have permission
            
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            // stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // if we have the coordinates, send into Yelp API
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
    
    }
    
    func getBusinesses(category:String, location:CLLocation) {
        
        // create URL
//        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
//        let url = URL(string: urlString)
        
        var urlConponents = URLComponents(string:"https://api.yelp.com/v3/businesses/search")
        urlConponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "category", value: Constants.restaurantsKey),
            URLQueryItem(name: "limit", value: "6")
        ]
        var url = urlConponents?.url
        
        if let url {
            // create url request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer iZh0RCjzUFSUYr_GUDnXSzBo9-RqozeHPt2Bpfd_yrChxlovhezDGEHhAPqCX7bqnlWmMDLZY8D5UyptU929Zxe8DTyeixfl0F-iGodhtpdfZwDqI-t-lBKSQbZeY3Yx", forHTTPHeaderField: "Authorization")
            
            //get urlsesson
            let session = URLSession.shared
            
            //crete data task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    do {
                        // Parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            switch category {
                            case Constants.sightsKey:
                                self.sights = result.businesses
                            case Constants.restaurantsKey:
                                self.restaurants = result.businesses
                            default:
                                break
                            }
                            
//                            if category == Constants.sightsKey {
//                                self.sights = result.businesses
//                            }
//                            else if category == Constants.restaurantsKey {
//                                self.restaurants = result.businesses
//                            }
                        }
                        
                    }
                    catch {
                        print(error)
                    }
                }
                
            }
            // start the data task
            dataTask.resume()
        }
        
        
    }
    
    
}
