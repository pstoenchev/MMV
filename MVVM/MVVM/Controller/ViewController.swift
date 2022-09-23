//
//  ViewController.swift
//  MVVM
//
//  Created by Petar Stoenchev on 15.09.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUsersData()
  
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.usersProjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserRepoTableViewCell
        let modelRepo = viewModelUser.usersProjects[indexPath.row]
        cell?.titleLabel.text = modelRepo.name
        cell?.subtitleLabel.text = modelRepo.description
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelRepo = viewModelUser.usersProjects[indexPath.row]

        if modelRepo.description == nil {
            return 50
        }
        
        return 100
    }
}


