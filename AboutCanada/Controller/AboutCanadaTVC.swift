//
//  AboutCanadaTVC.swift
//  AboutCanada
//
//  Created by Rex Jason Alobba on 1/3/18.
//  Copyright © 2018 Rex Jason Alobba. All rights reserved.
//

import UIKit

class AboutCanadaTVC: UITableViewController {

    var factItems = [Fact]()
    
    fileprivate struct storyboard {
        static let cellReuseIdentifier = "factsaboutcanada"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        runAPI()
    }
    

    func runAPI() {
        let api = APIManager()
        api.loadData(CANADA_SOURCE, completion: didLoadData)
    }
    

    func didLoadData(_ items: [Fact]) {
        self.factItems = items
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: storyboard.cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = self.factItems[indexPath.row].title

        return cell
    }
}
