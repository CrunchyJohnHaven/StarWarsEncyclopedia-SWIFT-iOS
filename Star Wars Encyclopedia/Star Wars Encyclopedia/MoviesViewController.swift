//
//  MoviesViewController.swift
//  Star Wars Encyclopedia
//
//  Created by john bradley on 3/19/18.
//  Copyright © 2018 john. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {
    var films: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://swapi.co/api/films")
        let session  = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
            
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.films.append(filmDict["title"]! as! String)
                        }
                    }
                    print("#1")
                    DispatchQueue.main.async {
                            self.tableView.reloadData()
                    }
                }
            } catch {
                print("Error")
            }
        })
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }
}
