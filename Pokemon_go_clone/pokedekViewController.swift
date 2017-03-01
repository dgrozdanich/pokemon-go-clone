//
//  pokedekViewController.swift
//  Pokemon_go_clone
//
//  Created by Dylan on 2/27/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import UIKit

class pokedekViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var caughtPokemons : [Pokemon] = []
    var uncaughtPokemons : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        caughtPokemons = getAllCaughtPokemons()
        uncaughtPokemons = getAllUncaughtPokemons()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
