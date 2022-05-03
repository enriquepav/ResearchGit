//
//  ShowReposViewController.swift
//  LoginAndRegistrationPage
//
//  Created by Enrique Plinio Alata Vences on 20/04/22.
//

import UIKit

class ShowReposViewController: UIViewController {
    


    @IBOutlet weak var repoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mostrarQuotesPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuotes", sender: self)
        
    }
    @IBAction func mostrarReposPressed(_ sender: Any) {
        performSegue(withIdentifier: "showRepos", sender: self)
        repoTextField.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepos"{
            if let destination = segue.destination as? ReposViewController{
                destination.gitUser = repoTextField.text!
            }
        }
    }
}
