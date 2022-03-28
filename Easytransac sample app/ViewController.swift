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
    static let CALLBACK_SCHEME = "easytransacsampleapp://result";
    
    @IBAction func btnFlash(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "flash",
            "amount": "1.07",
            "isDemo": "true",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnManual(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "manual",
            "amount": "1.02",
            "isDemo": "true",
            "customerLastname": "Lademo",
            "customerFirstname": "Paul",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnMail(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "mail",
            "amount": "1.03",
            "isDemo": "true",
            "customerEmail": "demo@easytransac.com",
            "customerLastname": "Lademo",
            "customerFirstname": "Paul",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnQRCode(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "qrcode",
            "amount": "1.04",
            "isDemo": "true",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func btnSms(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "sms",
            "amount": "1.05",
            "isDemo": "true",
            "customerCallingCode": "33",
            "customerPhone": "0611223344",
            "callback": ViewController.CALLBACK_SCHEME
        ];
        
        openUrl(generateUrlScheme(dict))
    }
    
    @IBAction func actionMultipleFlash(_ sender: Any) {
        let dict: KeyValuePairs = [
            "apiKey": ViewController.API_KEY,
            "paymentMethod": "flash",
            "amount": "100",
            "isDemo": "true",
            "isMultiplePayment": "true",
            "downPayment": "30",
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
                print("App opened")
            }
        }
    }
}
