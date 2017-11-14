//
//  Tipo_Assinatura.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Assinatura {
    
    var  id_tipo_assinatura: Int = 0
    var  id_assinante:Int = 0 
    
    // Extração da Assinatura
    init(json : [String : Any]) {
        self.id_tipo_assinatura = json["id_tipoAssinatura"] as? Int ?? 0
        self.id_assinante = json["id_assinante"] as? Int ?? 0
    }
    
    init(id_tipo_assinatura : Int , id_assinante : Int) {
        self.id_tipo_assinatura = id_tipo_assinatura
        self.id_assinante = id_assinante
    }
    required init?(coder aDecoder: NSCoder) {
        
        // Extração do basico do Anunciante
        self.id_tipo_assinatura = aDecoder.decodeObject(forKey : "id_tipo_assinatura") as? Int ?? 0
        self.id_assinante = aDecoder.decodeObject(forKey : "nome_assinatura") as? Int ?? 0
    }
}
