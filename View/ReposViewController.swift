//
//  ReposViewController.swift
//  LoginAndRegistrationPage
//
//  Created by Enrique Plinio Alata Vences on 21/04/22.
//

import UIKit

class ReposViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var repos: [Repo] = []
    var gitUser: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        getRepos(gitUser: gitUser){ result in
            self.repos = result
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
            
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableViewCell
        
        cell.repo = repos[indexPath.row]
        
        return cell
    }
    @IBAction func cerrarPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
}

