//
//  Pagamento.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation


class Pagamento {
    
    var  id_pagamento : Int
    
    var  status : Int
    
    var  assinante : Assinatura
    
    var  tipo_assinatura : Tipo_Assinatura

    init( id_pagamento : Int,  status : Int,  assinante: Assinatura,  tipo_assinatura : Tipo_Assinatura) {
        
        self.id_pagamento = id_pagamento
        self.status = status
        self.assinante = assinante
        self.tipo_assinatura = tipo_assinatura
    }
}
