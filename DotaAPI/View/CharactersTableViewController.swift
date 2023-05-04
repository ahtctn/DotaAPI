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
        self.initViewModel()
        self.observeEvent()
        
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
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    //MARK: TODO CELL İÇERİSİNDE ÖNCELİKLE KAHRAMANIN FOTOĞRAFI YANINDA VERTICAL STACK VIEW İÇERİSİNDE İSİM VE KAHRAMANIN DESCRIPTON'I VE YAN TARAFINDA DISCLOSURE INDICATOR OLACAK.
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
        let item = self.viewModel.heroCell(at: indexPath.row)
        
        let vc = HeroDetailViewController()
        vc.name = item.name
        vc.image = item.image
        vc.primaryAttirbute = item.primaryAttirbute
        vc.roles = item.roles
        vc.attackRange = item.attackRange
        vc.attackRate = item.attackRate
        vc.attackType = item.attackType
        
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }
}


extension CharactersTableViewController {
    func initViewModel() {
        viewModel.fetchHeroes()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .loading:
                print("product Loading")
            case .stopLoading:
                print("stop loading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error(let error):
                print("Error: \(error?.localizedDescription as Any)")
            }
        }
    }
}
