//
//  ViewController.swift
//  marvel-guide
//
//  Created by Rafael Díaz on 31/07/2018.
//  Copyright © 2018 Rafael Díaz. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource {
    
    var marvelCharactersData:MarvelCharacters? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let resultsNumber = self.marvelCharactersData?.data.results.count {
//            return resultsNumber
//        } else {
            return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let all = self.marvelCharactersData {
            let characters = all.data.results
                cell.textLabel?.text = characters[indexPath.row].name
        }
        return cell
    }
    
    @IBAction func button(_ sender: Any) {
        print("button pressed")
        ApiService.instance.getCharacters(with: "Spider") { (retrieved) in
            let characters = retrieved.data.results
            for character in characters[0...] {
                print(character.name)
            }

            }
    }
}

