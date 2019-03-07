//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    //Gets called right before the app closes
    
    override func encodeRestorableState(with coder: NSCoder) {
        
        defer {super.encodeRestorableState(with: coder)}
        
        //Take the Planet -> Data -> Encode in coder
        
        var planetData: Data?
        
        do {
            planetData = try PropertyListEncoder().encode(planet)
        } catch {
            print("Error encoding Plante: \(error)")
        }
        
        guard let planet = planetData else {return}
        
        coder.encode(planet, forKey: "planetData")
        
        
    }
    //CALLED  when the app is open
    override func decodeRestorableState(with coder: NSCoder) {
        
        defer {super.decodeRestorableState(with: coder)}
        //Decode Planet Data -> Planet -> put in var planet
        
        guard let planetData = coder.decodeObject(forKey: "planetData") as? Data else {return}
        
        let planet = try? PropertyListDecoder().decode(Planet.self, from: planetData)
        
        self.planet = planet //This will trigger update views method//Otherwise you would have to do it after this line
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
}

//Implement the two app delegate mothods
//Add restoration ids in the story board
//Encode/Decode whatever info you need in the VC to be saved/restore
