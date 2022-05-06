//
//  Repo.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation

struct Repo:Codable {
    var name : String = ""
    var id : Int = 0
    var language : String? = ""
    var created_at : String = ""
    var updated_at : String = ""
    var url : String = ""
    var owner : Owner = Owner()
}

struct Owner:Codable{
    var avatar_url : String = ""
}
// agregar nuevas variables
