//
//  Email.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Email {
    
    var id_email : Int
    var email : String
    var id_anunciante : Int

    init (id_email : Int ,email : String ,id_anunciante : Int ){
        self.id_email = id_email
        self.email = email
        self.id_anunciante = id_anunciante
    }
    func toJSON()->[String:Any]{
    return ["id_email":self.id_email,
        "email":self.email,
        "id_anunciante":self.id_anunciante]
    }
    init(json : [String : Any]) {
        self.id_email = json["id_email"] as? Int ?? 0
        self.id_anunciante = json["id_anunciante"] as? Int ?? 0
        self.email = json["email"] as? String ?? ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Extração do basico do Anunciante
        self.id_email = aDecoder.decodeObject(forKey : "id_email") as? Int ?? 0
        self.id_anunciante = aDecoder.decodeObject(forKey : "id_anunciante") as? Int ?? 0
        self.email = aDecoder.decodeObject(forKey : "email") as? String ?? ""
    }
    
}
