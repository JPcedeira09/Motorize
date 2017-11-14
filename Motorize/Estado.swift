//
//  Estado.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Estado {
    
    var id_estado : Int
    var sigla : String
    var estado : String
    
    init(id_estado : Int, sigla : String, estado : String){
        self.id_estado = id_estado
        self.sigla = sigla
        self.estado = estado
    }
    
    func toJSON()->[String:Any]{
    return ["id_estado":self.id_estado,
        "sigla":self.sigla,
        "estado":self.estado]
    }
    // Extração do Estado
    init(json : [String : Any]) {
        self.id_estado = json["id_estado"] as? Int ?? 0
        self.sigla = json["sigla"] as? String ?? ""
        self.estado = json["estado"] as? String ?? ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Extração do basico do Anunciante
        self.id_estado = aDecoder.decodeObject(forKey :"id_estado") as? Int ?? 0
        self.sigla = aDecoder.decodeObject(forKey :"sigla") as? String ?? ""
        self.estado = aDecoder.decodeObject(forKey :"estado") as? String ?? ""
    }
}
