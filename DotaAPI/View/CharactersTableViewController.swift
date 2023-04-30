//
//  ViewController.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 30.04.2023.
//

import UIKit

class CharactersTableViewController: UIViewController {

    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(HeroTableViewCell.self, forCellReuseIdentifier: HeroTableViewCell.identifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIElements()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    private func setUIElements() {

        //MARK: NAVIGATION BAR
        self.title = "Heroes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: SUBVIEWS
        view.addSubview(tableView)
        
        //MARK: DELEGATIONS
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func configureUIElements() {
        
    }
}

extension CharactersTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroTableViewCell.identifier, for: indexPath) //as? HeroTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
