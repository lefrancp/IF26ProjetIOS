//
//  CursusBDD.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 08/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import Foundation
import SQLite

class CursusBDD{
    
    var database: Connection!
    let cursus_table = Table("cursus")
    let cursus_id = Expression<Int>("id")
    let cursus_numeroEtu = Expression<Int>("numEtu")
    let cursus_sigle = Expression<String>("sigle")
    let cursus_resultat = Expression<String>("resultat")
    let cursus_semestre = Expression<String>("semestre")
    let cursus_affectation = Expression<String>("affectation")
    var initiated = false;
    
    var pk = 0;    // valeur de départ pour la primary key
    var tableExist = false   // false la table n'est encore pas créée
    
    static let shared = CursusBDD()

    init(){
        if(self.initiated){}
        else{
            // Do any additional setup after loading the view, typically from a nib.
            print ("-->  Cursus initialized")
            do {let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
                database = try Connection("\(path)/db.sqlite3")
            }catch {
                print (error)
                print ("--> viewDidLoad fin")
            }
            self.initiated = true;
        }
}

    func getConnection() -> Connection{
        return self.database;
}

    func createTable() {
        print ("--> createTableCursus debut")
        if !self.tableExist {
            self.tableExist = true
            // Instruction pour faire un drop de la table USERS
            let dropTable = self.cursus_table.drop(ifExists: true)
            // Instruction pour faire un create de la table USERS
            let createTable = self.cursus_table.create { table in
                table.column(self.cursus_id, primaryKey: true)
                table.column(self.cursus_numeroEtu)
                table.column(self.cursus_sigle)
                table.column(self.cursus_resultat)
                table.column(self.cursus_semestre)
                table.column(self.cursus_affectation)
            }
            do {// Exécution du drop et du create
                try self.database.run(dropTable)
                try self.database.run(createTable)
                print ("Table cursus est créée")
            }catch {
                print (error)
            }
        }
        sqlite3_close(nil)
        print ("--> createTableCursus fin")
}

    func getPK() -> Int {
        self.pk += 1
        return self.pk
    }
    
    func deleteCursus(rowid:String)  {
        
        let alice = cursus_table.filter(cursus_sigle == rowid )
    
        do {
            try database.run(alice.delete())
            
        }
        catch {
            print (error)
            print ("--> deleteCursus fin")
        }
        
        return
}

    func insertCursus(numeroEtu: Int, sigle: String, resultat: String, semestre: String, affectation: String) {
        print ("--> insertTableCursus debut")
        let insert = self.cursus_table.insert(self.cursus_id <- getPK(), self.cursus_numeroEtu <- numeroEtu, self.cursus_sigle <- sigle, self.cursus_resultat <- resultat, self.cursus_semestre <- semestre, self.cursus_affectation <- affectation)
        do {try self.database.run(insert)
            print ("Insert ok")

        }catch {
            print (error)
            print ("--> insertTableCursus fin")
        }
                sqlite3_close(nil)
    }
    
    func countModule() {
    }
    
    func selectAll() ->  [Cursus] {
        print("---> SelectAll debut")
        
        var listeCursus: [Cursus] = []
        var cursus: Cursus;
        
        do{
            let cursuss = try self.database.prepare(self.cursus_table)
            for cursus in cursuss{
                print("id: ", cursus[self.cursus_id], ", numero Etudiant: ", cursus[self.cursus_numeroEtu], ", sigle: ", cursus[self.cursus_sigle], ", resultat: ", cursus[self.cursus_resultat], ", semestre: ", cursus[self.cursus_semestre], ", affectation: ", cursus[self.cursus_affectation])
                
                listeCursus.append((Cursus.init(numeroEtu: cursus[self.cursus_numeroEtu], sigle: cursus[self.cursus_sigle], resultat: cursus[self.cursus_resultat], semestre: cursus[self.cursus_semestre], affectation: cursus[self.cursus_affectation])))
            }
            
        }catch{
            print(error)
        }
        print("---> SelectAll fin")
        print( "cursus size", listeCursus.count)
                sqlite3_close(nil)
        return listeCursus
    }
    
    
    func selectCursusByNumEtu(numEtu: Int) ->  [Cursus] {
        print("---> SelectCursusByNumEtu debut")
        
        var listeCursus: [Cursus] = []
        
        do{
            let cursuss = try self.database.prepare(self.cursus_table)
            for cursus in cursuss{
                print("id: ", cursus[self.cursus_id], ", numero Etudiant: ", numEtu, ", sigle: ", cursus[self.cursus_sigle], ", resultat: ", cursus[self.cursus_resultat], ", semestre: ", cursus[self.cursus_semestre], ", affectation: ", cursus[self.cursus_affectation])
                
                listeCursus.append((Cursus.init(numeroEtu: numEtu, sigle: cursus[self.cursus_sigle], resultat: cursus[self.cursus_resultat], semestre: cursus[self.cursus_semestre], affectation: cursus[self.cursus_affectation])))
            }
            
        }catch{
            print(error)
        }
        print("---> SelectCursusByNumEtu fin")
        sqlite3_close(nil)
        return listeCursus
    }
}
