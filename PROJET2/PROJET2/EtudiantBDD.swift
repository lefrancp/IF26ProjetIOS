

import Foundation
import SQLite

class EtudiantBDD{
    
    var database: Connection!
    let etudiant_table = Table("etudiant")
    let etudiant_id = Expression<Int>("id")
    let etudiant_numeroEtu = Expression<Int>("numEtu")
    let etudiant_nom = Expression<String>("nom")
    let etudiant_prenom = Expression<String>("prenom")
    let etudiant_admission = Expression<String>("admission")
    let etudiant_filiere = Expression<String>("filiere")
    var initiated = false;
    
    var pk = 0;    // valeur de départ pour la primary key
    var tableExist = false   // false la table n'est encore pas créée
    
    static let shared = EtudiantBDD()
    
    init(){
        if(self.initiated){}
        else{
            print ("-->  Etudiant initialized")
            do {let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
                database = try Connection("\(path)/db.sqlite3")
                print ("\(path)/db.sqlite3")
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
        print ("--> createTableEtudiant debut")
        if !self.tableExist {
            self.tableExist = true
            // Instruction pour faire un drop de la table USERS
            let dropTable = self.etudiant_table.drop(ifExists: true)
            // Instruction pour faire un create de la table USERS
            let createTable = self.etudiant_table.create { table in
                table.column(self.etudiant_id, primaryKey: true)
                table.column(self.etudiant_numeroEtu)
                table.column(self.etudiant_nom)
                table.column(self.etudiant_prenom)
                table.column(self.etudiant_admission)
                table.column(self.etudiant_filiere)
            }
            do {// Exécution du drop et du create
                try self.database.run(dropTable)
                try self.database.run(createTable)
                print ("Table etudiant est créée")
            }catch {
                print (error)
            }
        }
                sqlite3_close(nil)
        print ("--> createTableEtudiant fin")
        
        //insertEtudiant(numeroEtu: Int, prenom: String, nom: String, admission: String, filiere: String)
        
    }
    
    func getPK() -> Int {
        self.pk += 1
        return self.pk
    }
    
    func deleteEtudiant(rowid:String)  {
        
        let alice = etudiant_table.filter(etudiant_nom == rowid )
        
        //try database.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
        // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
        // WHERE ("id" = 1)
        
        
        do {
            try database.run(alice.delete())
            
        }
        catch {
            print (error)
            print ("--> deleteEtudiant fin")
        }
        // DELETE FROM "users" WHERE ("id" = 1)
        
        return
    }
    
    
    func insertEtudiant(numeroEtu: Int, prenom: String, nom: String, admission: String, filiere: String) {
        print ("--> insertTableEtudiant debut")
        // Insertion de 2 tuples exemples (sera réalisé à chaque click sur le bouton)
        let insert = self.etudiant_table.insert(self.etudiant_id <- getPK(), self.etudiant_numeroEtu <- numeroEtu, self.etudiant_nom <- nom, self.etudiant_prenom <- prenom, self.etudiant_admission <- admission, self.etudiant_filiere <- filiere)
        do {try self.database.run(insert)
            print ("Insert ok")
        }catch {
            print (error)
            print ("--> insertTableEtudiant fin")
        }
                sqlite3_close(nil)
    }
    
    func countModule() {
    }
    
    func selectAll() ->  [Etudiant] {
        print("---> SelectAll debut")
        
        var listeEtudiants: [Etudiant] = []
        var etudiant: Etudiant;
        
        do{
            let etudiants = try self.database.prepare(self.etudiant_table)
            for etudiant in etudiants{
                print("id: ", etudiant[self.etudiant_id], ", numero Etudiant: ", etudiant[self.etudiant_numeroEtu], ", prenom: ", etudiant[self.etudiant_prenom], ", nom: ", etudiant[self.etudiant_nom], ", admission: ", etudiant[self.etudiant_admission], ", filiere: ", etudiant[self.etudiant_filiere])
                
                listeEtudiants.append((Etudiant.init(numeroEtu: etudiant[self.etudiant_numeroEtu], prenom: etudiant[self.etudiant_prenom], nom: etudiant[self.etudiant_nom], admission: etudiant[self.etudiant_admission], filiere: etudiant[self.etudiant_filiere])))
            }
            
        }catch{
            print(error)
        }
        print("---> SelectAll fin")
        print( "etudiants size", listeEtudiants.count)
                sqlite3_close(nil)
        return listeEtudiants
    }
    

}
