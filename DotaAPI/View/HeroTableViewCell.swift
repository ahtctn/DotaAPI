//
//  HeroTableViewCell.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 30.04.2023.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    static let identifier = "TableViewCellIdentifier"
    let viewModel = HeroViewModel()
    
    private let _imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.image = UIImage(systemName: "questionmark")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        return image
    }()
    
    private let _label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(_imageView)
        contentView.addSubview(_label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        _label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            _imageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            _imageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            _imageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            _imageView.heightAnchor.constraint(equalToConstant: 100),
            _imageView.widthAnchor.constraint(equalToConstant: 100),
            
            _label.leadingAnchor.constraint(equalTo: _imageView.trailingAnchor, constant: 6),
            _label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            _label.topAnchor.constraint(equalTo: contentView.topAnchor),
            _label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
    }
    
    func configure(with item: HeroModel) {
        self._label.text = item.name
        self._imageView.image = UIImage(systemName: "questionmark")
    }
}
