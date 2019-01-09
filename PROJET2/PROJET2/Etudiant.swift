//
//  Etudiant.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 07/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class Etudiant {
    var numeroEtu: Int
    var prenom: String
    var nom: String
    var admission: String
    var filiere: String

    init() {
        numeroEtu = 0
        prenom = "?"
        nom = "?"
        admission = "?"
        filiere = "?"
        
    }
    init(numeroEtu: Int, prenom: String, nom: String, admission: String, filiere: String) {
        self.numeroEtu = numeroEtu
        self.prenom = prenom
        self.nom = nom
        self.admission = admission
        self.filiere = filiere
        
    }
}
