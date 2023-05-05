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
    
    init() { }
    
    func fetchHeroes() {
        self.eventHandler?(.loading)
        Networking.shared.fetchHeroes { response in
            switch response {
            case .success(let hero):
                self.hero = hero
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
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
