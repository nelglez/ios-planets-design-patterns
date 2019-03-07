//
//  PlanetController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

class PlanetController {
    //Facade pattern
    //Computer property takes care of figuring out whether pluto should be included or not. This way, nothing else in the app has to figure it out.
    var planets: [Planet] {
        var planets =  [
            Planet(name: "Mercury", imageName: "mercury"),
            Planet(name: "Venus", imageName: "venus"),
            Planet(name: "Earth", imageName: "earth"),
            Planet(name: "Mars", imageName: "mars"),
            Planet(name: "Jupiter", imageName: "jupiter"),
            Planet(name: "Saturn", imageName: "saturn"),
            Planet(name: "Uranus", imageName: "uranus"),
            Planet(name: "Neptune", imageName: "neptune"),
            ]
        
        let shouldShowPluto = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
        
        if shouldShowPluto {
            planets.append(Planet(name: "Pluto", imageName: "pluto"))
        }
        
        return planets
    }
    
}
