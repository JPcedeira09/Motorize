//
//  Carro.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation


class Carro {
 
    var  id_carro: Int
    var  marca: String
    var  modelo:String
    var  versao:String
    //var  carroceria:String
    var  tipo_veiculo:String
    
    init( id_carro: Int ,  marca:String  , modelo:String ,  versao: String,tipo_veiculo:String) {
    
    self.id_carro = id_carro
    self.marca = marca
    self.modelo = modelo
    self.versao = versao
   // self.carroceria = carroceria
    self.tipo_veiculo = tipo_veiculo
    }
    
    
    init(json : [String : Any]) {
        
        self.id_carro = json["id_carro"] as? Int ?? 0
        self.marca = json["marca"] as? String ?? ""
        self.modelo =  json["modelo"] as? String ?? ""
        self.versao = json["versao"] as? String ?? ""
        self.tipo_veiculo = json["tipo_veiculo"] as? String ?? ""
        
    }
    

}
