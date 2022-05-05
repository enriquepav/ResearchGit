//
//  ReposViewController.swift
//  LoginAndRegistrationPage
//
//  Created by Enrique Plinio Alata Vences on 21/04/22.
//

import UIKit

class ReposViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var userIdRepo: UILabel!
    @IBOutlet weak var imageUserRepo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var repos: [Repo] = []
    var gitUser: String = ""
    var avatarUrl : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        userIdRepo.text = gitUser
        
        getRepos(gitUser: gitUser){ result in
            self.repos = result
            self.avatarUrl = (result.first?.owner.avatar_url)!
            
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
                self.imageUserRepo.load(url:URL(string: self.avatarUrl)!)
                
                                   }
            }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableViewCell
        cell.delegate = self
        
        cell.repo = repos[indexPath.row]
        
        return cell
    }
    @IBAction func cerrarPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
extension ReposViewController : RepoTableViewCellDelegate {
    
    func showDetail(repo: Repo?) {
        let storyBoardMain = UIStoryboard (name: "Main", bundle: .main)
        if let vc = storyBoardMain.instantiateViewController(withIdentifier: "popUp") as? PopUpViewController{
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.definesPresentationContext = true
            vc.repo = repo!
            
            present(vc, animated: true, completion: nil)
        }
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
