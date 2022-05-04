//
//  Repo.swift
//  ResearchGit
//
//  Created by Enrique Plinio Alata Vences on 1/05/22.
//

import Foundation

struct Repo:Codable {
    let name : String
    let id : Int
    let language : String?
    let created_at : String
    let updated_at : String
    let url : String
    let owner : Owner
}

struct Owner:Codable{
    let avatar_url : String
}
// agregar nuevas variables
