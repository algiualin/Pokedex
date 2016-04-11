//
//  PokeCell.swift
//  pokedex
//
//  Created by Pralea Danut on 11/04/16.
//  Copyright © 2016 Parhelion Software. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
 
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
    }
    
    
    
    func configureCell(pokemon: Pokemon!) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
}
