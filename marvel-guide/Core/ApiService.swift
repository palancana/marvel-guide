//
//  ApiService.swift
//  marvel-guide
//
//  Created by Rafael Díaz on 02/08/2018.
//  Copyright © 2018 Rafael Díaz. All rights reserved.
//

import Foundation
import Alamofire
import StringMD5

// This is how the API service is called
//        ApiService.instance.getCharacters(with: "Spider") { (result, error) in
//            print(result)
//            print(error)
//        }

class ApiService {
    
    typealias  CompletionHandler = (_ result: MarvelCharacters) -> ()
    
    static let instance = ApiService()
    
    func getCharacters(with name: String, completion: @escaping CompletionHandler) {
        
        let ts = NSDate().timeIntervalSince1970.description
        let hash = "\(ts)\(PRIVATE_KEY)\(PUBLIC_KEY)".md5
        
        // TODO: Marvel API gives 100 results as maximum. A search could give more than that
        // so an infinite scroll may be needed...
        let parameters: Parameters = [
            "ts": ts,
            "nameStartsWith": name,
            "limit": RESULTS_LIMIT,
            "apikey": PUBLIC_KEY,
            "hash": hash
        ]
        
        Alamofire.request(URL_CHARACTERS, method: .get, parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        let response: MarvelCharacters = try! JSONDecoder().decode(MarvelCharacters.self, from: data)
                        completion(response)
                    }
                case .failure(let error):
                    //completion(a, error)
                    print("Error at ApiService: \(error)")
                }
        }
    }
}
