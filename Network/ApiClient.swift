//
//  ApiClient.swift
//  ResearchGit
//
//  Created by Katherine Caillahua Castillo on 3/05/22.
//

import Foundation

public struct ApiClient {
    
    //Obtención de las citas desde el servicio
    // este responde un objeto quotes que es esperado en el viewmodel
   func getQuotes(completed: @escaping(Quotes)-> ()){
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
    
    
    func getRepos(gitUser:String, completed: @escaping([Repo])->Void){
        if let url = URL(string: "https://api.github.com/users/" + gitUser + "/repos"){
            URLSession.shared.dataTask(with: url){
                data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([Repo].self, from: data)
                        completed(res)
                    }catch let error {
                            print(error)
                        }
                        
                    }
                }.resume()
        }
    }
}
