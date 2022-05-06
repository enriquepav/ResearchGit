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
        nameRepo.text = "El Nombre del repositorio es: \n" + repo.name
        idRepo.text = "El ID del repositorio es: \n" + String (repo.id)
        if (repo.language == nil){
            languageRepo.text = "El repositorio tiene un lenguaje no especificado"}
        else {
            languageRepo.text = "El repositorio usa el lenguaje: \n" + repo.language!
        }
        createdRepo.text = "La fecha de creación: \n" + repo.created_at
        updateRepo.text = "La última modificación: \n" + repo.updated_at
        urlRepo.text = "Repositorio URL: \n" + repo.url
    }
    
    @IBAction func didTapBackground(_ sender: Any) {
        dismiss(animated: true)
    }
}
