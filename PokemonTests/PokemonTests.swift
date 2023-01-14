//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by Felipe Goncalves de Toledo on 11.01.23.
//

import XCTest
@testable import PokemonAPI
@testable import Pokemon

final class PokemonTests: XCTestCase {


    func testPokemonAPIList() {
        PokemonManager.sharedInstance.getPokemons() { pokemons in
            XCTAssertNotNil(pokemons)
            XCTAssertTrue(pokemons!.count > 0)
        }
        
    }
    
    func testPokemonAPIGetPokemon() {
        PokemonManager.sharedInstance.getPokemon(name: "butterfree") { pokemon in
            XCTAssertNotNil(pokemon)
        }
    }

}
