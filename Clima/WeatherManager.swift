//
//  WeatherManager.swift
//  Clima
//
//  Created by Elias Ferreira on 08/07/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={API_KEY}&units=metric"
    
    var weatherDelegate: WeatherDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName.replacingOccurrences(of: " ", with: "%20"))"
        perfomRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        perfomRequest(urlString: urlString)
    }
    
    func perfomRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.weatherDelegate?.didFaildWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            self.weatherDelegate?.weatherResponse(weatherModel: weather)
        } catch {
            self.weatherDelegate?.didFaildWithError(error: error)
        }
    }
}
