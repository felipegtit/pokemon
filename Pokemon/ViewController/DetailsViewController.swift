//
//  DetailsViewController.swift
//  Pokemon
//
//  Created by Felipe Goncalves de Toledo on 13.01.23.
//

import UIKit
import LazyImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var baseExp: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var abilities: UILabel!
    
    lazy var lazyImage:LazyImage = LazyImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        let name = PokemonManager.sharedInstance.getCurrentPokemon()?.name
        pokemonName.text = name?.capitalizingFirstLetter()

        PokemonManager.sharedInstance.getPokemon(name: name!) { pokemon in
            guard pokemon != nil else { return }
            DispatchQueue.main.async {
                self.lazyImage.showWithSpinner(imageView:self.pokemonImage, url: pokemon?.sprites?.frontDefault)
                
                self.number.text?.append(" " + String((pokemon?.id)!))
                self.baseExp.text?.append(" " + String((pokemon?.baseExperience)!))
                self.height.text?.append(" " + String((pokemon?.height)!))
                self.weight.text?.append(" " + String((pokemon?.weight)!))
                pokemon?.types?.forEach { type in
                    self.type.text?.append(" " + (type.type?.name)!)
                }
                pokemon?.abilities?.forEach { ability in
                    self.abilities.text?.append(" " + (ability.ability?.name)!)
                }
            }

        }
        
    }
    
}
