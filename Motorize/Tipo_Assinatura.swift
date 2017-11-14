//
//  Tipo_Assinatura.swift
//  appmotorize
//
//  Created by joao cedeira on 08/09/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Tipo_Assinatura {
    
    private var  id_tipo_assinatura : Int
    private var  nome_assinatura : String
    private var  sigla_assinatura : String
    private var  valor_assinatura : Double
    
    init(json : [String:Any]) {
        self.id_tipo_assinatura = json["id_tipo_assinatura"] as? Int ?? 0
        self.nome_assinatura = json["nome_assinatura"] as? String ?? ""
        self.sigla_assinatura = json["sigla_assinatura"] as? String ?? ""
        self.valor_assinatura = json["valor_assinatura"]as? Double ?? 0.0
    }
    
}
