//
//  AnuncioFiltro.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation

class AnuncioFiltro {
    
    
    var  id_anuncio: Int
    var  id_carro_anuncio: Int
    var  id_anunciante: Int
    var  marca: String
    var  modelo: String
    var  versao: String
    var  carroceria: String
    var  tipo_veiculo: String
    var  final_placa: Int
    var  numero_portas: Int
    var  cor: String
    var  tipo_de_necessidade: String
    var  opcional: String
    var  blindagem: String
    var  dataUm: Date
    var  dataDois: Date
    var  valorUM: Double
    
    var  valorDois: Double
    
    var  kilometragemUm: Double
    
    var  kilometragemDois: Double
    
    
    init( id_anuncio: Int ,  id_carro_anuncio: Int,  id_anunciante: Int,  marca: String,  modelo: String,versao: String ,  carroceria:String ,  tipo_veiculo:String ,  final_placa: Int,  numero_portas:Int ,  cor: String,
          String tipo_de_necessidade: String,  opcional: String,  blindagem: String,  dataUm: Date, Date dataDois: Date, double valorUM: Double,
          valorDois:Double ,  kilometragemUm:Double ,  kilometragemDois:Double) {
        
        self.id_anuncio = id_anuncio
        self.id_carro_anuncio = id_carro_anuncio
        self.id_anunciante = id_anunciante
        self.marca = marca
        self.modelo = modelo
        self.versao = versao
        self.carroceria = carroceria
        self.tipo_veiculo = tipo_veiculo
        self.final_placa = final_placa
        self.numero_portas = numero_portas
        self.cor = cor
        self.tipo_de_necessidade = tipo_de_necessidade
        self.opcional = opcional
        self.blindagem = blindagem
        self.dataUm = dataUm
        self.dataDois = dataDois
        self.valorUM = valorUM
        self.valorDois = valorDois
        self.kilometragemUm = kilometragemUm
        self.kilometragemDois = kilometragemDois
    }
    
}
