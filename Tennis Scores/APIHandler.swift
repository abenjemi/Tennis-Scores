//
//  APIHandler.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 7/10/22.
//

import Foundation

class APIHandler {
    private init() {}
    static let shared = APIHandler()
    
    static let headers = [
        "X-RapidAPI-Key": "c38f15efa6mshac563c3f3e7c18bp1edf1ajsnc57dec6ddb1c",
        "X-RapidAPI-Host": "tennis-live-data.p.rapidapi.com"
    ]

    func getRequest(url: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIHandler.headers
        
        return request
    }
    
    
    func requestData(_ url: String, completion: @escaping (Result<Data,NSError>) -> Void) {
        let session = URLSession.shared
        let request = getRequest(url: url)
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let response = response {
                print(response as URLResponse)
            }
            if let unwrappedError = error {
                completion(.failure(unwrappedError as NSError))
            } else if let unwrappedData = data {
                completion(.success(unwrappedData))
            }
        }
        
        dataTask.resume()
    }
}
