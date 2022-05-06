//
//  ViewModelgetRepos.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation

class ViewModelgetRepos : NSObject {
    
    private var apiClient : ApiClient!
    
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    
    //Almacena la data de quotes
    private(set) var reposData : [Repo]! {
        didSet {
            //aqui se le setea la acción a la vista
            self.bindReposViewModelToController()
        }
    }

    //Bindeamos data a la vista
    //Al llamar a este bind se ejecuta una acción en el view
    var bindReposViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiClient =  ApiClient()
    }
    
    //Llamada de la data al servicio
    func callFuncToGetRepos(gitUser: String) {
        // Aquí gestionamos otras acciones de la view, p.e mostrar u ocultar un loader en base a la respuesta
        showLoading?()
        self.apiClient.getRepos(gitUser: gitUser) { (repos) in
            //recibimos la respuesta del servicio
            self.reposData = repos
            self.hideLoading?()
        }
    }
}
