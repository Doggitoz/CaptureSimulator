//
//  ViewController.swift
//  CaptureSimulator
//
//  Created by Coleton Wheeler on 4/17/19.
//  Copyright © 2019 Front Row. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var caughtLabel: UILabel!
    
    var difficulty = 5
    var amountOfTries = 0
    var randomIndex = 0
    var currentPokemon = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        generateNewPokemon()
    }
    
    @IBAction func runAway(_ sender: Any)
    {
        generateNewPokemon()
    }
    
    func generateNewPokemon()
    {
        //Generate random index
        randomIndex = Int.random(in: 0...134)
        
        //Select pokemon data
        let newPokemon:String = Pokelist.pokelist[randomIndex][0] as! String
        let newDifficulty:Int = Pokelist.pokelist[randomIndex][1] as! Int
        currentPokemon = newPokemon
        updateGameData(pokemonName: newPokemon, newDifficulty: newDifficulty)
    }
    
    func updateGameData(pokemonName: String, newDifficulty: Int)
    {
        //Update the image and difficulty values for the new pokemon
        pokemon.image = UIImage(named: pokemonName)
        difficulty = newDifficulty
        print(difficulty)
    }
    
    
    @IBAction func throwPokeball(_ sender: Any)
    {
        //Clear label
        caughtLabel.text = ""
        
        //Generate variables for catchrate and run formulas
        let number = Int.random(in: 1...255)
        let tries = Int.random(in: 3...10)
        let a = (48 * difficulty)
        
        //Print to console for debugging
        print("\(number)")
        print("\(a)")
        
        //Pokeball
        pokemon.image = UIImage(named: "pokeball")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkCatch(a: a, tries: tries, number: number)
        }
    }
    
    func checkCatch(a: Int, tries: Int, number: Int) {
        //Check if the pokemon is caught or not
        if number > a {
            caughtLabel.text = "Caught!"
            pokemon.image = UIImage(named: "stars")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.generateNewPokemon()
            }
        }  else {
            caughtLabel.text = "The pokemon failed to be caught!"
            pokemon.image = UIImage(named: currentPokemon)
            amountOfTries = amountOfTries + 1
            if amountOfTries > tries {
                pokemon.image = UIImage(named: "runaway")
                caughtLabel.text = "The pokemon fled!"
                amountOfTries = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.generateNewPokemon()
                }
            }
        }
    }
}

