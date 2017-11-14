//
//  Endereco.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Endereco {
    
    var  id_pessoa:Int
    var  id_endereco:Int
    var  cep: String
    var  rua:String
    var  numero:String
    var  complemento:String
    var  bairro:String
    var  estado:Estado
    var  cidade:Cidade
    
    init (id_endereco:Int,estado:Estado , cidade:Cidade ,cep: String , rua:String ,numero:String ,complemento:String ,bairro:String,id_pessoa:Int){
        self.id_endereco = id_endereco
        self.estado = estado
        self.cidade = cidade
        self.cep = cep
        self.rua = rua
        self.numero = numero
        self.complemento = complemento
        self.bairro = bairro
        self.id_pessoa = id_pessoa
    }
    
    func toJSON()->[String:Any]{
    return["id_pessoa":self.id_pessoa,
           "id_endereco":self.id_endereco,
        "cep":self.cep,
        "rua":self.rua,
        "numero":self.numero,
        "complemento":self.complemento,
        "bairro":self.bairro,
        "estado":self.estado.toJSON(),
        "cidade":self.cidade.toJSON()
        ]
    }
    // Extração do Endereço
    init(json : [String : Any]) {
        self.id_endereco = json["id_endereco"] as? Int ?? 0
        self.estado = Estado(json: json["estado"]  as? [String : Any] ?? [:])
        self.cidade = Cidade(json: json["cidade"]  as? [String : Any] ?? [:])
        self.cep = json["cep"] as? String ?? ""
        self.rua =  json["numero"] as? String ?? ""
        self.numero = json["numero"] as? String ?? ""
        self.complemento = json["complemento"] as? String ?? ""
        self.bairro = json["bairro"] as? String ?? ""
        self.id_pessoa = json["id_pessoa"] as? Int ?? 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Extração do basico do Anunciante
        
        self.id_endereco = aDecoder.decodeObject(forKey :"id_endereco") as? Int ?? 0
        self.estado = Estado(coder: aDecoder.decodeObject(forKey : "estado") as! NSCoder)!
        self.cidade = Cidade(coder: aDecoder.decodeObject(forKey : "cidade") as! NSCoder)!
        self.cep = aDecoder.decodeObject(forKey :"cep") as? String ?? ""
        self.rua = aDecoder.decodeObject(forKey :"numero") as? String ?? ""
        self.numero = aDecoder.decodeObject(forKey :"numero") as? String ?? ""
        self.complemento = aDecoder.decodeObject(forKey :"complemento") as? String ?? ""
        self.bairro = aDecoder.decodeObject(forKey :"bairro") as? String ?? ""
        self.id_pessoa = aDecoder.decodeObject(forKey :"id_pessoa") as? Int ?? 0
        
    }
    
}
