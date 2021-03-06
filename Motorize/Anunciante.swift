//
//  Anunciante.swift
//  Motorize_Final
//
//  Created by joao cedeira on 10/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation
import UIKit


struct Anunciante {
    
    var id_pessoa  :  Int
    var nome  :  String
    var CPF : String
    var senha : String
    // private Date ano_nascimento;
    var telefone : String
    var celular : String
    var tipo_pessoa : String
    var status : String
    
    
    func descrever()-> String{
        return " nome:\(self.nome)\n CPF:\(self.CPF)"
    }
    
    init(id_pessoa : Int, nome : String, CPF : String, senha : String, celular : String, telefone : String, tipo_pessoa : String, status : String){
        self.id_pessoa = id_pessoa
        self.nome = nome
        self.CPF = CPF
        self.senha = senha
        self.celular = celular
        self.telefone = telefone
        self.tipo_pessoa = tipo_pessoa
        self.status = status
    }
    
    func toDict (_ anunciante : Anunciante) -> [String:Any]{
        return ["id_pessoa":anunciante.id_pessoa,
                "nome":anunciante.nome,
                "CPF":anunciante.CPF,
                "senha":anunciante.senha,
                "celular":anunciante.celular,
                "telefone":anunciante.telefone,
                "tipo_pessoa":anunciante.tipo_pessoa,
                "status":anunciante.status
        ]
    }
    
    init( anuncianteJSON : [String : Any]) {
        self.id_pessoa = anuncianteJSON["id_pessoa"] as? Int ?? 0
        self.nome =  anuncianteJSON["nome"] as? String ?? ""
        self.CPF = anuncianteJSON["CPF"] as? String ?? ""
        self.senha = anuncianteJSON["senha"] as? String ?? ""
        self.celular =  anuncianteJSON["celular"] as? String ?? ""
        self.telefone = anuncianteJSON["telefone"] as? String ?? ""
        self.tipo_pessoa = anuncianteJSON["tipo_pessoa"] as? String ?? ""
        self.status = anuncianteJSON["status"] as? String ?? ""
    }
}

