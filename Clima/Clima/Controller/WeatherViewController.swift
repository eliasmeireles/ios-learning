//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weaterhManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weaterhManager.weatherDelegate = self
        searchTextField.delegate = self
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    fileprivate func onSearchPressed() {
        searchTextField.endEditing(true)
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        onSearchPressed()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onSearchPressed()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        
        textField.placeholder = "Type something"
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weaterhManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherDelegate

extension WeatherViewController: WeatherDelegate {
    
    func weatherResponse(weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherModel.temperatureString
            self.cityLabel.text = weatherModel.cityName
            self.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
        }
    }
    
    func didFaildWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            self.weaterhManager.fetchWeather(latitude: lat, longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
