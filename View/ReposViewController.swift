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
    
    private var reposViewModel : ViewModelgetRepos!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        userIdRepo.text = gitUser
        
        initViewModel()
        callToViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    
    // este método inicializa el viewmodel
    func initViewModel(){
        self.reposViewModel =  ViewModelgetRepos()
        
        //hacemos el llamado de la data porque necesitamos enviarle un gitUser
        self.reposViewModel.callFuncToGetRepos(gitUser: gitUser)
        
        //observamos el showloading
        reposViewModel.showLoading = {
            DispatchQueue.main.async {
            }
        }
        
        //observamos el hideLoading
        reposViewModel.hideLoading = {
            DispatchQueue.main.async {
            }
        }
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
    
    func callToViewModelForUIUpdate(){
           
           self.reposViewModel.bindReposViewModelToController = {
               // al completar la respuesta se ejete un update data ya que es un observer
               self.updateData()
           }
    }
    
    func updateData(){
        DispatchQueue.main.async {
            // aquí accedemos a la data que se queda almacenada en el viewmodel en nuestra variable "quoteData"
            // de esa forma usamos el contenido y solo mostramos los datos que necesitamos
            self.repos = self.reposViewModel.reposData
            self.avatarUrl = (self.reposViewModel.reposData.first?.owner.avatar_url)!
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.imageUserRepo.load(url:URL(string: self.avatarUrl)!)
            }
        }
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
