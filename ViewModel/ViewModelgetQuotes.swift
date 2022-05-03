//
//  ViewModelgetQuotes.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation


func getQuotes(completed: @escaping(Quotes)-> Void){
    if let url = URL(string: "https://animechan.vercel.app/api/random"){
        URLSession.shared.dataTask(with: url){
            data, response, error in
            if let data = data {
                do {
                    let res = try
                    JSONDecoder().decode(Quotes.self,from: data)
                    completed(res)
                }catch let error {
                    print (error)
                }
            }
        }.resume()
    }
}
