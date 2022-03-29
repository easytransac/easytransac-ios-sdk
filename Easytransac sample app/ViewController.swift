//
//  ViewController.swift
//  Easytransac sample app
//
//  Created by Damien Chabanne on 25/03/2022.
//

import UIKit

class ViewController: UIViewController {
        
    static let API_KEY = "YOUR_API_KEY=="
    static let EASYTRANSAC_SCHEME = "easytransac://pay"
    
    // callback scheme is defined on the Info.plist URL Types
    // https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
    static let CALLBACK_SCHEME = "easytransacsampleapp://result";
    
    @IBAction func btnFlash(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "flash",
            "amount": "107",
            "demo": "true",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnManual(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "manual",
            "amount": "102",
            "demo": "true",
            "lastname": "Lademo",
            "firstname": "Paul",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnMail(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "mail",
            "amount": "103",
            "demo": "true",
            "email": "demo@easytransac.com",
            "lastname": "Lademo",
            "firstname": "Paul",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnQRCode(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "qrcode",
            "amount": "104",
            "demo": "true",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnSms(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "sms",
            "amount": "105",
            "demo": "true",
            "callingCode": "33",
            "phone": "0611223344",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func actionMultipleFlash(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "flash",
            "amount": "10000",
            "demo": "true",
            "multiplePayments": "true",
            "downPayments": "3000",
            "multiplePaymentRepeat": "3",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    // Generate URL Scheme from given parameters
    private func generateUrlScheme(_ dict: KeyValuePairs<String, String>) -> String {
        var url = ViewController.EASYTRANSAC_SCHEME;
        for values in dict {
            url.append(url == ViewController.EASYTRANSAC_SCHEME ? "?" : "&");
            url.append("\(values.key)=\(values.value)")
        }
        
        return url;
    }
    
    private func openUrl(_ urlString: String) {
        let url = URL(string: urlString)
        UIApplication.shared.open(url!) { (result) in
            if result {
                print("App opened with success")
            }
        }
    }
}
