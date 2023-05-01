//
//  HeroViewModel.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import Foundation

class HeroViewModel {
    var hero: [HeroModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    init() {
        self.hero = [
            HeroModel(name: "İnanna", image: "person.fill"),
            HeroModel(name: "Dumuzi", image: "person.fill"),
            HeroModel(name: "Gılgameş", image: "person.fill"),
            HeroModel(name: "Enkidu", image: "person.fill"),
            HeroModel(name: "Ereşkigal", image: "person.fill"),
            HeroModel(name: "Ea", image: "person.fill"),
            HeroModel(name: "Enki", image: "person.fill"),
        ]
    }
    
    func numberOfRows() -> Int {
        return self.hero.count
    }
    
    func heroCell(at index: Int) -> HeroModel {
        return self.hero[index]
    }
    
}


extension HeroViewModel {
    enum Event {
        case loading
        case dataLoaded
        case stopLoading
        case error(_ error: Error?)
    }
}
