//
//  ViewModelgetRepos.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation

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
