//
//  ViewController.swift
//  DotaAPI
//
//  Created by Ahmet Ali ÇETİN on 30.04.2023.
//

import UIKit

class CharactersTableViewController: UIViewController {
    
    private let viewModel = HeroViewModel()

    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(HeroTableViewCell.self, forCellReuseIdentifier: HeroTableViewCell.identifier)
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIElements()
        
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    private func setUIElements() {

        //MARK: DELEGATIONS
        self.tableView.delegate = self
        self.tableView.dataSource = self

        //MARK: NAVIGATION BAR
        self.title = "Heroes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: SUBVIEWS
        view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension CharactersTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.viewModel.heroCell(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroTableViewCell.identifier, for: indexPath) as? HeroTableViewCell  else {
            return UITableViewCell()
        }
        cell.configure(with: item)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let vc = HeroDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

