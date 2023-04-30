//
//  HeroViewModel.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import Foundation

class HeroViewModel {
    var heroModel: [HeroModel] = [HeroModel]()
    var eventHandler: ((_ event: Event) -> Void)?
    
    var heroes: [HeroModel] = [
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
        HeroModel(name: "Deneme Yapıyorum", image: "person.fill"),
    ]
    
    
}


extension HeroViewModel {
    enum Event {
        case loading
        case dataLoaded
        case stopLoading
        case error(_ error: Error?)
    }
}
