//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Felipe Goncalves de Toledo on 12.01.23.
//

import Foundation
import PokemonAPI

public class PokemonManager {
    
    static let sharedInstance = PokemonManager()
    
    public var currentSelectedIndex = -1
    public var pokemons:[PKMNamedAPIResource<PKMPokemon>]? = nil
    
    public func getPokemons(completion: @escaping (([PKMNamedAPIResource<PKMPokemon>]?) -> ())) {
        PokemonAPI().pokemonService.fetchPokemonList() { result in
            switch result {
                case .success(let pokemon):
                    
                    self.pokemons = pokemon.results as? [PKMNamedAPIResource]

                    completion(self.pokemons)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
            }
        }
    }
    
    public func getPokemon(name: String, completion: @escaping ((PKMPokemon?) -> ())) {
        PokemonAPI().pokemonService.fetchPokemon(name) { result in
            switch result {
                case .success(let pokemon):
                
                    completion(pokemon)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
            }
        }
    }
    
    public func getCurrentPokemon() -> PKMNamedAPIResource<PKMPokemon>? {
        guard pokemons != nil else { return nil }
        return pokemons?[currentSelectedIndex]
    }
}
