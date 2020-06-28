//
//  NetworkManager.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-11.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func getCovidInfo(completion: @escaping (Result<[Country], CovidError>) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "covid-193.p.rapidapi.com",
            "x-rapidapi-key": "f63b680794msh66d2f9938a5886fp14467ajsnffbc318250f1"
        ]
        guard let url = NSURL(string: "https://covid-193.p.rapidapi.com/statistics") else { return }
        let request = NSMutableURLRequest(url: url as URL,
                                          cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else  {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let counries = try decoder.decode(Countries.self, from: data)
                completion(.success(counries.response))
                
            } catch {
                completion(.failure(.invalidData))
            }
        })
        dataTask.resume()
    }
    
    func getCountryCovidInfo(for country: String, completion: @escaping (Result<[Country], CovidError>) -> Void) {
        
        guard let encodedCountry = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let headers = [
            "x-rapidapi-host": "covid-193.p.rapidapi.com",
            "x-rapidapi-key": "f63b680794msh66d2f9938a5886fp14467ajsnffbc318250f1"
        ]
        guard let url = NSURL(string: "https://covid-193.p.rapidapi.com/statistics?country=\(encodedCountry)") else { return }
        let request = NSMutableURLRequest(url: url as URL,
                                          cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else  {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let counries = try decoder.decode(Countries.self, from: data)
                completion(.success(counries.response))
                
            } catch {
                completion(.failure(.invalidData))
            }
        })
        dataTask.resume()
    }
    
}
