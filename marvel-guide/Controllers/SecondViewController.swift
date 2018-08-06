//
//  SecondViewController.swift
//  marvel-guide
//
//  Created by Rafael Díaz on 05/08/2018.
//  Copyright © 2018 Rafael Díaz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var character:Result? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = character?.name
//        print("Name: \(String(describing: character?.name))")
//        print("Description: \(String(describing: character?.description))")
//        print("Modified: \(String(describing: character?.modified))")
//        print("ResourceURI: \(String(describing: character?.resourceURI))")
//        //print("urls: \(character?.urls)")
//        print("thumbnail: \(String(describing: character?.thumbnail.path)) + \(String(describing: character?.thumbnail.thumbnailExtension))")
        print(character ?? "non")
//        print("comics: \()")
//        print("stories: \()")
//        print("events: \()")
//        print("series: \()")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
