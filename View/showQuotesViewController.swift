//
//  showQuotesViewController.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 24/04/22.
//

import UIKit

class showQuotesViewController: UIViewController {

    @IBOutlet weak var titleQuotes: UILabel!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var quotes: Quotes = Quotes(anime: "", character: "", quote: "")
    
    //instanciamos nuestro viewmodel
    private var quotesViewModel : ViewModelgetQuotes!

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        callToViewModelForUIUpdate()
    }
    
    // este método inicializa el viewmodel
    func initViewModel(){
        self.quotesViewModel =  ViewModelgetQuotes()
        
        //observamos el showloading
        quotesViewModel.showLoading = {
            DispatchQueue.main.async {
                self.titleQuotes.text = ""
                self.labelQuote.text = ""
                self.activityIndicator.startAnimating()
            }
        }
        
        //observamos el hideLoading
        quotesViewModel.hideLoading = {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // este método recibe la acción del bind data
    func callToViewModelForUIUpdate(){
           
           self.quotesViewModel.bindQuotesViewModelToController = {
               // al completar la respuesta se ejete un update data ya que es un observer
               self.updateData()
           }
    }
    
    func updateData(){
        DispatchQueue.main.async {
            // aquí accedemos a la data que se queda almacenada en el viewmodel en nuestra variable "quoteData"
            // de esa forma usamos el contenido y solo mostramos los datos que necesitamos
            self.titleQuotes.text = "The quote by " + self.quotesViewModel.quoteData.character + " Anime: " + self.quotesViewModel.quoteData.anime
            self.labelQuote.text = self.quotesViewModel.quoteData.quote
        }
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


