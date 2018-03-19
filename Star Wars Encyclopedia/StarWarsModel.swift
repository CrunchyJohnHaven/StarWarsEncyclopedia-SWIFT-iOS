//
//  StarWarsModel.swift
//  Star Wars Encyclopedia
//
//  Created by john bradley on 3/19/18.
//  Copyright © 2018 john. All rights reserved.
//
//The 'M' in MVC -> use the class to make API requests
import Foundation
class StarWarsModel {
    static func getAllPeople(completionHandler:@escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        print("getAllPeople")
        let url = URL(string: "http://swapi.co/api/people/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    static func getAllFilms(completionHandler:@escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        print("getAllFilms")
        let url = URL(string: "http://swapi.co/api/films/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
