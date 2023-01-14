//
//  ViewController.swift
//  Pokemon
//
//  Created by Felipe Goncalves de Toledo on 11.01.23.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        animationView = .init(name: "pokeball")
        animationView!.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animationView!.center = self.view.center
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.animationView!.transform = CGAffineTransform(scaleX: 6, y: 6)
        }) { _ in
            self.animationView!.play() { _ in
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
        
    }
}

