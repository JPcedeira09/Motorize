//
//  Pessoa.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class Pessoa {
    
    var id_anunciante: Int
    var nome: String
    var CPF: String
    var senha: String
    var data_nascimento: String
    var celular:String
    var telefone: String
    var tipo_pessoa :String
    
    init( id_anunciante: Int ,  nome: String ,  CPF: String , String senha: String ,  data_nascimento: String ,  celular:  String,
          telefone: String ,  tipo_pessoa : String) {
        self.id_anunciante = id_anunciante
        self.nome = nome
        self.CPF = CPF
        self.senha = senha
        self.data_nascimento = data_nascimento
        self.celular = celular
        self.telefone = telefone
        self.tipo_pessoa = tipo_pessoa
    }
    
}
