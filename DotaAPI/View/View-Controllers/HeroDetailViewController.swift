//
//  HeroDetailViewController.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import UIKit

class HeroDetailViewController: UIViewController {

    var name: String = ""
    var image: String = ""
    var primaryAttirbute = ""
    var roles: [String] = []
    var attackRange: Int = 0
    var attackRate: Double = 0
    var attackType: String = ""
    
    let heroImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 40)
        return lbl
    }()
    
    let rolesLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    let attackRangeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        
        return lbl
    }()
    
    let attackRangeLabelBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.shadowColor = CGColor(red: 0, green: 1, blue: 1, alpha: 1)
        view.layer.shadowRadius = 10
        view.layer.shadowPath = CGPath(roundedRect: CGRect(x: 0, y: 0, width: 10, height: 20), cornerWidth: 12.0, cornerHeight: 120.0, transform: .none)
        return view
    }()
    
    let attackRateLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    let attackRateLabelBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let attackTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.injectUIElementsWithData()
        self.roles = []
        // Do any additional setup after loading the view.
    }
    
    private func injectUIElementsWithData() {
        self.heroImageView.image = UIImage(systemName: "book.fill")
        self.nameLabel.text = name
        var allRoles: String = ""
        for role in roles {
            allRoles.append("\(role), ")
        }
        self.rolesLabel.text = allRoles
        self.attackRangeLabel.text = "Range: \(attackRange)"
        self.attackRateLabel.text = "Rate: ⭐️\(attackRate)"
        self.attackTypeLabel.text = attackType
    }
    
    private func setUI() {
        let range = Int(attackRange)
        let rate = Double(attackRate)
        
        self.view.addSubview(heroImageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(rolesLabel)
        
        self.view.addSubview(attackRangeLabel)
        self.view.addSubview(attackRangeLabelBackgroundView)
        self.attackRangeLabelBackgroundView.addSubview(attackRangeLabel)
        
        self.view.addSubview(attackRateLabel)
        self.view.addSubview(attackRateLabelBackgroundView)
        self.attackRateLabelBackgroundView.addSubview(attackRateLabel)
        
        self.view.addSubview(attackTypeLabel)
        
        self.view.backgroundColor = .systemBackground
        heroImageView.backgroundColor = .white
        
        
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        heroImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        heroImageView.layer.cornerRadius = 100
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 50).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        rolesLabel.translatesAutoresizingMaskIntoConstraints = false
        rolesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50).isActive = true
        rolesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        attackRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        attackRangeLabel.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 50).isActive = true
        attackRangeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        
        
        attackRangeLabelBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        attackRangeLabelBackgroundView.leadingAnchor.constraint(equalTo: attackRangeLabel.leadingAnchor, constant: -20).isActive = true
        attackRangeLabelBackgroundView.trailingAnchor.constraint(equalTo: attackRangeLabel.trailingAnchor, constant: 20).isActive = true
        attackRangeLabelBackgroundView.topAnchor.constraint(equalTo: attackRangeLabel.topAnchor,constant: -20).isActive = true
        attackRangeLabelBackgroundView.bottomAnchor.constraint(equalTo: attackRangeLabel.bottomAnchor, constant: 20).isActive = true
        if range >= 600 {
            attackRangeLabelBackgroundView.backgroundColor = .systemGreen
        } else if range <= 600 && range >= 300 {
            attackRangeLabelBackgroundView.backgroundColor = .systemOrange
        } else if range <= 300 {
            attackRangeLabelBackgroundView.backgroundColor = .systemRed
        }
        
        attackRateLabel.translatesAutoresizingMaskIntoConstraints = false
        attackRateLabel.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 50).isActive = true
        attackRateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        
        attackRateLabelBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        attackRateLabelBackgroundView.leadingAnchor.constraint(equalTo: attackRateLabel.leadingAnchor, constant: -20).isActive = true
        attackRateLabelBackgroundView.trailingAnchor.constraint(equalTo: attackRateLabel.trailingAnchor, constant: 20).isActive = true
        attackRateLabelBackgroundView.topAnchor.constraint(equalTo: attackRateLabel.topAnchor,constant: -20).isActive = true
        attackRateLabelBackgroundView.bottomAnchor.constraint(equalTo: attackRateLabel.bottomAnchor, constant: 20).isActive = true
        
        if rate >= 1.7 && rate <= 2.0 {
            attackRateLabelBackgroundView.backgroundColor = .systemGreen
        } else if rate < 1.7 && rate >= 1.6 {
            attackRateLabelBackgroundView.backgroundColor = .systemYellow
        } else if rate < 1.6 && rate >= 1.5 {
            attackRateLabelBackgroundView.backgroundColor = .systemOrange
        } else if rate < 1.5 {
            attackRateLabelBackgroundView.backgroundColor = .systemRed
        }
        
        attackTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        attackTypeLabel.topAnchor.constraint(equalTo: attackRateLabel.bottomAnchor, constant: 50).isActive = true
        attackTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}
