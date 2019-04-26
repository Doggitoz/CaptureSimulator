//
//  ViewController.swift
//  CaptureSimulator
//
//  Created by Coleton Wheeler on 4/17/19.
//  Copyright © 2019 Front Row. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var caughtLabel: UILabel!
    
    var difficulty = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var ref = Database.database().reference()
        
    }
    
    
    @IBAction func runAway(_ sender: Any) {
        generateNewPokemon()
    }
    
    func generateNewPokemon() {
        //let id = Int.random(in: 1...202)
        //ref.
        //let name = "Zigzagoon"
        let pokemon = "Zigzagoon"
        updateGameData(pokemonName: pokemon)
    }
    
    func updateData(){
        
        
    }
    
    func updateGameData(pokemonName: String) {
        pokemon.image = UIImage(named: pokemonName)
        difficulty = 1
    }
    
    
    @IBAction func throwPokeball(_ sender: Any) {
        let number = Int.random(in: 1...255)
        let tries = Int.random(in: 10...20)
        var amountOfTries = 0
        let a = (48 * difficulty)
        
        print("\(number)")
        print("\(a)")
        
        if number > a {
            caughtLabel.text = "Caught!"
            updateData()
            generateNewPokemon()
        } else if amountOfTries > tries {
            caughtLabel.text = "The pokemon fled!"
            amountOfTries = 0
            generateNewPokemon()
        } else {
            caughtLabel.text = "Your bad idot"
            amountOfTries += 1
        }
    }
}

