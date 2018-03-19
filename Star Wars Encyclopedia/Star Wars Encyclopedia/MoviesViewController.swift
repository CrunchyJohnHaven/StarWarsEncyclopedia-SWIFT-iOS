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
        StarWarsModel.getAllFilms(completionHandler: {data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options:
                    JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            let title = filmDict["title"]! as! String
                            let release_date = filmDict["release_date"]! as! String
                            let director = filmDict["director"]! as! String
                            let opening_crawl = filmDict["opening_crawl"]! as! String
                            self.films.append(title)
                            self.films.append("Released: " + release_date)
                            self.films.append("Directed By: " + director)
                            self.films.append("Opening Crawl: " + opening_crawl)
                            self.films.append("     ")


                            
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong")
            }
        })
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }
}
