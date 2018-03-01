//
//  ViewController.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 28/2/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testRunData() // For debugging URL call
    }

    func testRunData() {
        let api = APIManager()
        api.loadData(CANADA_SOURCE, completion: didLoadData)
    }
    
    func didLoadData(_ items: [Fact]) {
        for item in items {
            print("title = \(item.title!)")
            print("description = \(item.description!)")
            print("imageHref = \(item.imageHref!)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

