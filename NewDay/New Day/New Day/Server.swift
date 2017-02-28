//
//  Server.swift
//  New Day
//
//  Created by ray on 28/02/2017.
//  Copyright © 2017 Jeavil. All rights reserved.
//

import Foundation

protocol URLConvertible {
    var URLValue: URL? { get }
}

extension String: URLConvertible {
    var URLValue: URL? {
        return URL(string: urlString)
    }
}

extension URLComponents: URLConvertible {
    var URLValue: URL? {
        return url
    }
}

protocol URLRequestConvertible{
    var request: URLRequest { get }
}

extension URL: URLRequestConvertible {
    var request: URLRequest {
        return URLRequest.init(url: self)
    }
}

protocol RequestResult {
    init(data: Data?, response: URLResponse?, error: Swift.Error?)
    var success: Bool { get }
    var value: Any? { get }
    var error: Swift.Error? { get }
}

protocol APIRequestable {
    associatedtype Result: RequestResult
    func makeRequest(with parameter: [String: Any]?) -> URLRequest
}

extension APIRequestable {
    func request(with parameter: [String: Any]?, retryTimes: Int = 2, completionHandler: @escaping (Result) -> Void) {
        let request = makeRequest(with: parameter)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error, retryTimes > 0
                && (error as NSError).code != NSURLErrorCancelled
                && (error as NSError).code != NSURLErrorUnsupportedURL {
                DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: { 
                    self.request(with: parameter, retryTimes: retryTimes - 1, completionHandler: completionHandler)
                })
                
                return
            }
            
            let result = Result(data: data, response: response, error: error)
            completionHandler(result)
        }.resume()
    }
}
