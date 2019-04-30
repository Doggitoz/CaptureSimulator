//
//  ViewController.swift
//  CaptureSimulator
//
//  Created by Coleton Wheeler on 4/17/19.
//  Copyright © 2019 Front Row. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseDatabase
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var caughtLabel: UILabel!
    
    var numberOfPokemon = 202
    var difficulty = 5
    var amountOfTries = 0
    
    var ref = Database.database().reference()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
    }
    
    @IBAction func runAway(_ sender: Any)
    {
        generateNewPokemon()
    }
    
    func generateNewPokemon()
    {
        //let userID = Auth.auth()
        //Generate random index in pokemon database
       // let randomIndex = Int.random(in: 1...numberOfPokemon)
        //ref.child("pokemon").child(<#T##pathString: String##String#>)
        
        let pokemon = "Zigzagoon"
        updateGameData(pokemonName: pokemon)
    }
    
    func updateData()
    {
        //Set values for pokedex metadata
        
    }
    
    func updateGameData(pokemonName: String)
    {
        //Update the image and difficulty values for the new pokemon
        pokemon.image = UIImage(named: pokemonName)
        difficulty = 1
    }
    
    
    @IBAction func throwPokeball(_ sender: Any)
    {
        //Generate variables for catchrate and run formulas
        let number = Int.random(in: 1...255)
        let tries = Int.random(in: 10...20)
        let a = (48 * difficulty)
        
        //Print to console for debugging
        print("\(number)")
        print("\(a)")
        
        //Check if the pokemon is caught or not
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
            amountOfTries = amountOfTries + 1
        }
    }
}

