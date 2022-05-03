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
    var quotes: Quotes = Quotes(anime: "", character: "", quote: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuotes(){ result in
            self.quotes = result
            DispatchQueue.main.async {
                self.titleQuotes.text = "The quote by " + self.quotes.character + " Anime: " + self.quotes.anime
                self.labelQuote.text = self.quotes.quote
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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


