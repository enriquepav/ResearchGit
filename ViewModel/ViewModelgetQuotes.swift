//
//  ViewModelgetQuotes.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation

class ViewModelgetQuotes : NSObject {
    
    private var apiClient : ApiClient!
    
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    //Almacena la data de quotes
    private(set) var quoteData : Quotes! {
        didSet {
            //aqui se le setea la acción a la vista
            self.bindQuotesViewModelToController()
        }
    }

    //Bindeamos data a la vista
    //Al llamar a este bind se ejecuta una acción en el view
    var bindQuotesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiClient =  ApiClient()
        callFuncToGetQuotes()
    }
    
    //Llamada de la data al servicio
    func callFuncToGetQuotes() {
        // Aquí gestionamos otras acciones de la view, p.e mostrar u ocultar un loader en base a la respuesta
        showLoading?()
        self.apiClient.getQuotes() { (quotes) in
            //recibimos la respuesta del servicio
            self.quoteData = quotes
            self.hideLoading?()
        }
    }
}
