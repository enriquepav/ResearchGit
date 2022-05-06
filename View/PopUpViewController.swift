//
//  PopUpViewController.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 4/05/22.
//

import UIKit


class PopUpViewController: UIViewController {
    @IBOutlet weak var nameRepo: UILabel!
    @IBOutlet weak var idRepo: UILabel!
    @IBOutlet weak var languageRepo: UILabel!
    @IBOutlet weak var createdRepo: UILabel!
    @IBOutlet weak var updateRepo: UILabel!
    @IBOutlet weak var urlRepo: UILabel!
    var repo: Repo =  Repo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRepo.text = "El Nombre del repositorio es: " + repo.name
        idRepo.text = "El ID del repositorio es " + String (repo.id)
        if (repo.language == nil){
            languageRepo.text = "El repositorio tiene un lenguaje no especificado"}
        else {
            languageRepo.text = "El repositorio usa el lenguaje:" + repo.language!
        }
        createdRepo.text = "La fecha de creación:" + repo.created_at
        updateRepo.text = "La última modificación:" + repo.updated_at
        urlRepo.text = "Repositorio URL:" + repo.url
        
    }
    
    @IBAction func didTapBackground(_ sender: Any) {
        dismiss(animated: true)
        }
    
        

        // Do any additional setup after loading the view.
    
    
    
}
