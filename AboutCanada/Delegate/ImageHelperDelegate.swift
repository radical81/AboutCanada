//
//  ImageHelperDelegate.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 1/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import Foundation
import UIKit

protocol ImageHelperDelegate {
    func getFactImage(_ item: Fact, imageView: UIImageView, imgUrl: String)
}
