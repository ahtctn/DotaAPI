//
//  HeroTableViewCell.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 30.04.2023.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    static let identifier = "TableViewCellIdentifier"
    
    private let _imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.image = UIImage(systemName: "person.fill")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        return image
    }()
    
    private let _label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hero 1"
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
        
        let imageSize = contentView.frame.size.height - 50
        
        _imageView.frame = CGRect(x: 10, y: 10, width: 75, height: contentView.frame.size.height - 20)
        _label.frame = CGRect(x: imageSize + _imageView.frame.size.width, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
}
