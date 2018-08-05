//
//  ViewController.swift
//  marvel-guide
//
//  Created by Rafael Díaz on 31/07/2018.
//  Copyright © 2018 Rafael Díaz. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var lookFor: UISearchBar!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var characters:MarvelCharacters? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searching for \(lookFor.text!)...")
        spinner.startAnimating()
        ApiService.instance.getCharacters(with: lookFor.text!) { retrieved in
            self.characters = retrieved
            
            // TODO: Remove this when testing has finished or unit tests are done
            // Print it for testing purposes
            for character in self.characters!.data.results[0...] {
                print(character.name)
            }
            print("Number of results: \(self.characters!.data.count)")
            
            self.spinner.stopAnimating()
            self.tableView.reloadData()
        }
        lookFor.resignFirstResponder()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.data.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        if ((characters?.data.results.count)! <= 0) {
            print("nothing found")
        } else {
            cell.textLabel?.text = characters?.data.results[indexPath.row].name
        }
        return cell
    }
}

