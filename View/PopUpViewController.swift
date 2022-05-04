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
    
    @IBAction func didTapBackground(_ sender: Any) {
        dismiss(animated: true)
        }
        
        

        // Do any additional setup after loading the view.
    
    
    
}
