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
    
    func getRepos(gitUser:String, completed: @escaping([Repo])->Void){
        if let url = URL(string: "https://api.github.com/users/" + gitUser + "/repos"){
            URLSession.shared.dataTask(with: url){
                data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([Repo].self, from: data)
                        completed(res)
                    }catch let error {
                            print(error)
                        }
                        
                    }
                }.resume()
        }
    }
}

struct Repo:Codable {
    let name : String
    let id : Int
    
}
