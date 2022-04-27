
import UIKit

protocol WeatherModelDelegate {
    func didUpdateWeather(_ weatherModel: WeatherModel, weather: WeatherInfo)
    func didFailWithError(error: Error)
}

struct WeatherModel {
    
    var delegate: WeatherModelDelegate?
    
    func getWeather(cityName: String)  {
        let defaultUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=2d6f1fc964023a96d8f5cf9fda254ad5&units=metric"
        getJSON(urlNeeded: defaultUrl)
    }
    
    func getJSON(urlNeeded: String) {
        if let url = URL(string: urlNeeded) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, Response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(wetherDataJSON: safeData) {
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(wetherDataJSON: Data) -> WeatherInfo? {
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: wetherDataJSON)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherInfo(conditionalId: id, cityName: name, temperature: temp)
            
            return weather
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
