//
//  Cursus.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 08/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class Cursus {
    var numeroEtu: Int
    var sigle: String
    var resultat: String
    var semestre: String
    var affectation: String
    
    init() {
        numeroEtu = 0;
        sigle = "?"
        resultat = "?"
        semestre = "?"
        affectation = "?"
    }
    
    init(numeroEtu: Int, sigle:String, resultat: String, semestre: String, affectation: String) {
        self.numeroEtu = numeroEtu
        self.sigle = sigle
        self.resultat = resultat
        self.semestre = semestre
        self.affectation = affectation
    }
}
