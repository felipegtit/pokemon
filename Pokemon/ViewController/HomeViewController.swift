//
//  HomeViewController.swift
//  Pokemon
//
//  Created by Felipe Goncalves de Toledo on 11.01.23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    var pokemonCount = 0
    private let reuseIdentifier = "PokemonCell"
    
    var detailsViewController: DetailsViewController {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "detailsID") as! DetailsViewController
        return vc
    }

    @IBOutlet weak var pokemonsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSplash()
        
        pokemonsCollectionView.delegate = self
        pokemonsCollectionView.dataSource = self
        
        PokemonManager.sharedInstance.getPokemons() { pokemons in
            guard pokemons != nil else { return }
            
            DispatchQueue.main.async {
                self.pokemonsCollectionView.reloadData()
            }
        }
    }
    
    private func showSplash() {
        let splashVC = self.storyboard?.instantiateViewController(withIdentifier: "splashID") as! SplashViewController
                self.navigationController?.pushViewController(splashVC, animated: true)
    }
    

    //COLLECTIONVIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let pokes = PokemonManager.sharedInstance.pokemons {
            return pokes.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.pokemonName.text = PokemonManager.sharedInstance.pokemons?[indexPath.row].name?.capitalizingFirstLetter()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PokemonManager.sharedInstance.currentSelectedIndex = indexPath.row
        detailsViewController.modalPresentationStyle = .automatic
        self.navigationController?.present(detailsViewController, animated: true)
    }
}
