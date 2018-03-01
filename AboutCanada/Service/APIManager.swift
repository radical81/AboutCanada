//
//  APIManager.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 1/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation

class APIManager {
    func loadData(_ urlString: String, completion: @escaping ([Fact]) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard data != nil else {
                print("Error: No data in response")
                return
            }
            
            //Check for special characters like É
            guard let responseDataString = NSString(data: data!, encoding: String.Encoding.isoLatin1.rawValue) else {
                return
            }

            //Convert to UTF-8
            guard let responseData = responseDataString.data(using: String.Encoding.utf8.rawValue) else {
                return
            }
            
            //Added for JSONSerialization
            do {
                /* .AllowFragments - top level object is not Array or Dictionary.
                 Any type of string or value
                 NSJSONSerialization requires the Do / Try / Catch
                 Converts the NSDATA into a JSON Object and cast it to a Dictionary */
                
                if let json = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [String: AnyObject],
                    let rowSet = json["rows"] as? [AnyObject]
                {
                    var factArray = [Fact]()
                    for (_, row) in rowSet.enumerated() {
                        guard let factItem = Fact(json: row) else {
                            continue
                        }
                        factArray.append(factItem)
                    }
                    
                    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                        DispatchQueue.main.async {
                            completion(factArray)
                        }
                    }
                }
            } catch {
                print("error in NSJSONSerialization \(error)")
            }
            //End of JSONSerialization
        })
        task.resume()
    }
}
