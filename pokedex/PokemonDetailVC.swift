//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Pralea Danut on 12/04/16.
//  Copyright © 2016 Parhelion Software. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let image = UIImage(named: "\(pokemon.pokedexId)")
        nameLbl.text = pokemon.name
        mainImg.image = image
        currentEvoImg.image = image
       
        
        pokemon.downloadPokemonDetails { () -> () in
           self.updateUI()
        }
        
    }
    
    func updateUI() {
       descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        heightLbl.text = pokemon.height
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No evolution"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next evolution: \(pokemon.nextEvolutionTxt)"
            evoLbl.text = str
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                evoLbl.text = str
            }
        }
        
        
      
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}
