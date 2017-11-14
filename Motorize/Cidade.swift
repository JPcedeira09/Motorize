//
//  Cidade.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Cidade {
    
    var id_estado : Int
    var id_cidade : Int
    var nome_cidade : String
    
    func toJSON()->[String:Any]{
     return ["id_estado":self.id_estado,
        "id_cidade":self.id_cidade,
        "nome_cidade":self.nome_cidade]
    }
    init(id_estado : Int ,id_cidade : Int ,nome_cidade : String) {
        self.id_estado = id_estado
        self.id_cidade = id_cidade
        self.nome_cidade = nome_cidade
    }
    
    // Extração da Cidade
    init(json : [String : Any]) {
        self.id_estado = json["id_estado"] as? Int ?? 0
        self.id_cidade = json["id_cidade"] as? Int ?? 0
        self.nome_cidade = json["nome_cidade"] as? String ?? ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Extração do basico do Anunciante
        self.id_estado = aDecoder.decodeObject(forKey :"id_estado") as? Int ?? 0
        self.id_cidade = aDecoder.decodeObject(forKey :"id_cidade") as? Int ?? 0
        self.nome_cidade = aDecoder.decodeObject(forKey :"nome_cidade") as? String ?? ""
    }
}
