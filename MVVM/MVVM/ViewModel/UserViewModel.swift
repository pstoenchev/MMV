//
//  UserViewModel.swift
//  MVVM
//
//  Created by Petar Stoenchev on 17.09.22.
//

import UIKit

class UserViewModel {
    
    weak var vc: ViewController?
    
    var usersProjects = [UserProjectModel]()
    
    func getAllUsersData() {
        URLSession.shared.dataTask(with: URL(string: "https://api.github.com/users/pstoenchev/repos")!) { data, response, error in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserProjectModel].self, from: data)
                            self.usersProjects.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                        
                        print(self.usersProjects)
                    } catch let err {
                        print("Error: \(err)")
                    }
                }
                
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
