//
//  ViewController.swift
//  CaptureSimulator
//
//  Created by Coleton Wheeler on 4/17/19.
//  Copyright © 2019 Front Row. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var caughtLabel: UILabel!
    
    var difficulty = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func runAway(_ sender: Any) {
        let pokemon = generateNewPokemon()
        updateData(pokemonName: pokemon)
    }
    
    func generateNewPokemon() -> String {
        let pokemon = "Zigzagoon"
        return pokemon
    }
    
    func updateData(pokemonName: String) {
        pokemon.image = UIImage(named: pokemonName)
        difficulty = 1
    }
    
    
    @IBAction func throwPokeball(_ sender: Any) {
        let number = Int.random(in: 1...255)
        print("\(number)")
        let a = (48 * difficulty)
        print("\(a)")
        if number > a {
            caughtLabel.text = "Caught!"
            let pokemon = generateNewPokemon()
            updateData(pokemonName: pokemon)
        } else {
            caughtLabel.text = "your bad idot"
        }
    }
}

