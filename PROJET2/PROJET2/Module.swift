//
//  Module.swift
//  Lemercier_tp09B
//
//  Created by Marc Lemercier on 26/11/2017.
//  Copyright © 2017 IF26. All rights reserved.
//

import Foundation


public class Module  {
    var sigle: String
    var categorie: String
    var credit: Int
    var resultat: Resultat
    
    init() {
        sigle = "?"
        categorie = "?"
        credit = 0
        resultat = Resultat.A
    }
    
    init(sigle: String, categorie: String, credit: Int, resultat: Resultat) {
        self.sigle = sigle
        self.categorie = categorie
        self.credit = credit
        self.resultat = resultat
    }
    
    public var descriptor: String {
        return "Module(\(sigle),\(categorie),\(credit),\(resultat))"
    }
}
