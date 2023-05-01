//
//  HeroModel.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let name: String
    let primaryAttirbute: String
    let attackType: String
    let roles: [String]
    let image: String
    let icon: String
    let attackRange: Int
    let attackRate: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "localized_name"
        case primaryAttirbute = "primary_attr"
        case attackType = "attack_type"
        case roles
        case image = "img"
        case icon
        case attackRange = "attack_range"
        case attackRate = "attack_rate"
    }
}

