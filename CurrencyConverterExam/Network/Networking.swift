//
//  Networking.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

class Networking: NSObject {
    
    public static let sharedInstance = Networking()
    var baseURL = SERVICE_ADDRESSES.address.getStringValue()
    
    func exchangeCurrency(fromCurrency: String,
                          amount:       String,
                          toCurrency:   String,
                          serverResponse: @escaping (_ response: ExchangeResponse?, _ error: String?)->()) {
        
        baseURL = SERVICE_ADDRESSES.address.getStringValue()
        baseURL += SERVICES_PATH.exchange.getStringValue()
        baseURL += amount + "-" + fromCurrency
        baseURL += "/" + toCurrency
        baseURL += SERVICES_PATH.latest.getStringValue()
        
        guard let url = URL(string: baseURL) else {
            return
        }
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                // check response status and err
                guard let data = data else { return }
                do {
                    let responseObject = try JSONDecoder().decode(ExchangeResponse.self, from: data)
                    serverResponse(responseObject, nil)
                } catch {
                    print("----  Faild to decode \(error)")
                    serverResponse(nil, "Faild to decode \(error)")
                }
            }.resume()
        }
        
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            // check response status and err
//            guard let data = data else { return }
//            do {
//                let responseObject = try JSONDecoder().decode(ExchangeResponse.self, from: data)
//                serverResponse(responseObject, nil)
//            } catch {
//                print("----  Faild to decode \(error)")
//                serverResponse(nil, "Faild to decode \(error)")
//            }
//        }.resume()
        
    }
    
}

