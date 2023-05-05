//
//  HeroTableViewCell.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 30.04.2023.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    static let identifier = Constants.Cell.id
    let viewModel = HeroViewModel()
    
    private let imgView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.image = UIImage(systemName: "questionmark")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        
        return image
    }()
    
    private let heroNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imgView)
        contentView.addSubview(heroNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 100),
            imgView.widthAnchor.constraint(equalToConstant: 100),
            
            heroNameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 6),
            heroNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            heroNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            heroNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    func configure(with item: HeroModel) {
        self.heroNameLabel.text = item.name
        
        DispatchQueue.main.async {
            self.imgView.setImage(with: "\(Constants.API.baseURL)\(item.icon)")
        }
        
    }
}
