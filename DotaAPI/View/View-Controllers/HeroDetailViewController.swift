//
//  HeroDetailViewController.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 1.05.2023.
//

import UIKit

class HeroDetailViewController: UIViewController {

    let _imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.image = UIImage(systemName: "person.fill")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        return iv
    }()
    
    let _label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hero name"
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        print(_label.text)
        // Do any additional setup after loading the view.
    }
    
    private func setUI() {
        self.view.addSubview(_imageView)
        self.view.addSubview(_label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
