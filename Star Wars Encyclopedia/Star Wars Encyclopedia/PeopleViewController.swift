//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by john bradley on 3/19/18.
//  Copyright © 2018 john. All rights reserved.
//

import UIKit
class PeopleViewController: UITableViewController {
    // Hardcoded data for now
    var people = ["Luke Skywalker", "Leia Organa", "Han Solo", "C-3PO", "R2-D2"]
    
    
    
    
    override func viewDidLoad() {
//        Make an http request code:
        super.viewDidLoad()
//        specify the url for the request set to let url variable
        let url = URL(string: "http://swapi.co/api/people/")
//       create the session as an instance of URLSession to handle the request task
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            do {
               if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        print(results)
                    }
                }
            } catch {
                print(error)
            }
        })
//        make actual request
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}
