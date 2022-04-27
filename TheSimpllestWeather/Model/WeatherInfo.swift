
import UIKit

struct WeatherInfo {
    
    let conditionalId: Int
    let cityName: String
    let temperature: Double
    var tempString: String {
        return String(format: "%.0f", temperature)
    }

    
    var conditionName: String {
        switch conditionalId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "pencil"
            
        }
    }
}
