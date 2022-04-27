//
//  ViewController.swift
//  TheSimpllestWeather
//
//  Created by M on 25.04.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherModelDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    func didUpdateWeather(_ weatherModel: WeatherModel, weather: WeatherInfo) {
        tempLabel.text = "now \(weather.tempString) ℃"
        cityNameVC.text = "in \(weather.cityName)"
        weratherImage.image = UIImage(systemName: weather.conditionName)
    }
    
   
    
    
    @IBOutlet var weratherImage: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var cityNameVC: UILabel!
    

    
    var weatherModel = WeatherModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherModel.delegate = self
    }
    
    
    @IBAction func cityNameTF(_ sender: UITextField) {
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text ?? "nocity")
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "c'mon enter city name"
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let safeText = textField.text {
            weatherModel.getWeather(cityName: safeText )
        }
        searchTextField.text = ""
        textField.placeholder = "one sec, mate"
    }
    
}

