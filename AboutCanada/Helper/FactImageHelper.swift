//
//  FactImageHelper.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 1/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation
import UIKit

class FactImageHelper: ImageHelperDelegate {
    func getFactImage(_ item: Fact, imageView: UIImageView, imgUrl: String) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let data = try? Data(contentsOf: URL(string: imgUrl)!)
            var image: UIImage?
            if data != nil {
                item.imageData = data
                image = UIImage(data: data!)
            }
            
            //move back to Main Queue
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}
