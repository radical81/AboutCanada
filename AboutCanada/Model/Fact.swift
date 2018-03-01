//
//  Fact.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 28/2/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation

class Fact: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
    var imageData: Data? //for storing generated image
    
    init?(json: AnyObject) {
        guard let title = json["title"] as? String else {
            return nil
        }
        guard let description = json["description"] as? String else {
            return nil
        }
        guard let imageHref = json["imageHref"] as? String else {
            return nil
        }
        self.title = title
        self.description = description
        self.imageHref = imageHref        
    }
}
