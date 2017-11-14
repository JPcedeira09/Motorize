//
//  Anuncio.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation
import UIKit

class Anuncio {
    
    var id_anuncio: Int
    var id_veiculo_anuncio: Int
    var id_anunciante: Int
    var marca: String
    var modelo: String
    var versao: String
    var carroceria: String
    var tipo_veiculo: String
    var ano_compra: String
    var kilometragem: String
    var preco: Double
    var final_placa: Int
    var numero_portas: Int
    var cor: String
    var tipo_de_necessidade: String
    var opcional: String
    var blindagem: String
    var numeroLikes : Int
    var tipoCombustivel : String
    var cambio: String
    var tracao: String
    
    init(AnuncioJSON : [String : Any] ) {
        
        self.id_anuncio = AnuncioJSON["id_anuncio"] as? Int ?? 0
        self.id_veiculo_anuncio = AnuncioJSON["id_veiculo_anuncio"] as? Int ?? 0
        self.id_anunciante = AnuncioJSON["id_anunciante"] as? Int ?? 0
        self.marca = AnuncioJSON["marca"] as? String ?? ""
        self.modelo = AnuncioJSON["modelo"] as? String ?? ""
        self.versao = AnuncioJSON["versao"] as? String ?? ""
        self.carroceria = AnuncioJSON["carroceria"] as? String ?? ""
        self.tipo_veiculo = AnuncioJSON["tipo_veiculo"] as? String ?? ""
        self.ano_compra = AnuncioJSON["ano_compra"] as? String ?? "" //as? Date)!
        self.kilometragem = AnuncioJSON["kilometragem"] as? String ?? ""
        self.preco = AnuncioJSON["preco"] as? Double ?? 0.0
        self.final_placa = AnuncioJSON["final_placa"] as? Int ?? 0
        self.numero_portas = AnuncioJSON["numero_portas"] as? Int ?? 0
        self.cor = AnuncioJSON["cor"] as? String ?? ""
        self.tipo_de_necessidade = AnuncioJSON["tipo_de_necessidade"] as? String ?? ""
        self.opcional = AnuncioJSON["opcional"] as? String ?? ""
        self.blindagem = AnuncioJSON["blindagem"] as? String ?? ""
        self.numeroLikes = AnuncioJSON["numeroLikes"] as? Int ?? 0
        self.tipoCombustivel = AnuncioJSON["gasolina"] as? String ?? ""
        self.cambio = AnuncioJSON["cambio"] as? String ?? ""
        self.tracao = AnuncioJSON["tracao"] as? String ?? ""
    }
    
    init (numeroLikes : Int ,tracao: String ,tipoCombustivel : String,id_anuncio: Int , id_veiculo_anuncio: Int , id_anunciante: Int , marca: String , modelo: String , versao: String , carroceria: String , tipo_veiculo: String , ano_compra: String , kilometragem: String ,preco: Double ,  final_placa: Int ,cambio: String , numero_portas: Int , cor: String , tipo_de_necessidade: String , opcional: String , blindagem: String   ) {
        //, imagem1 : [UIImage]
        self.tipoCombustivel = tipoCombustivel
        self.numeroLikes = numeroLikes
        self.id_anuncio = id_anuncio
        self.tracao = tracao
        self.id_veiculo_anuncio = id_veiculo_anuncio
        self.id_anunciante = id_anunciante
        self.marca = marca
        self.modelo = modelo
        self.cambio = cambio
        self.versao = versao
        self.carroceria = carroceria
        self.tipo_veiculo = tipo_veiculo
        self.ano_compra = ano_compra
        self.kilometragem = kilometragem
        self.preco = preco
        self.final_placa = final_placa
        self.numero_portas = numero_portas
        self.cor = cor
        self.tipo_de_necessidade = tipo_de_necessidade
        self.opcional = opcional
        self.blindagem = blindagem
        //self.imagem1 = imagem1
    }
    /**
     required init?(coder aDecoder: NSCoder) {
     
     self.anunciante = Anunciante.init(coder: aDecoder.decodeObject(forKey: "anunciante") as! NSCoder)!
     self.numeroLikes = aDecoder.decodeObject(forKey: "numeroLikes") as! Int
     self.tracao = aDecoder.decodeObject(forKey: "tracao") as! String
     self.id_anuncio = aDecoder.decodeObject(forKey : "id_anuncio") as! Int
     self.id_veiculo_anuncio = aDecoder.decodeObject(forKey : "id_veiculo_anuncio") as! Int
     self.id_anunciante = aDecoder.decodeObject(forKey : "id_anunciante") as! Int
     self.marca = aDecoder.decodeObject(forKey : "marca") as! String
     self.modelo = aDecoder.decodeObject(forKey : "modelo") as! String
     self.cambio = aDecoder.decodeObject(forKey : "cambio") as! String
     self.versao = aDecoder.decodeObject(forKey : "versao") as! String
     self.carroceria = aDecoder.decodeObject(forKey : "carroceria") as! String
     self.tipo_veiculo = aDecoder.decodeObject(forKey : "tipo_veiculo") as! String
     self.tipoCombustivel = aDecoder.decodeObject(forKey : "tipoCombustivel") as! String
     self.ano_compra = aDecoder.decodeObject(forKey : "ano_compra") as! String
     self.kilometragem = aDecoder.decodeObject(forKey : "kilometragem") as! Double
     self.preco = aDecoder.decodeObject(forKey : "preco") as! Double
     self.final_placa = aDecoder.decodeObject(forKey : "final_placa") as! Int
     self.numero_portas = aDecoder.decodeObject(forKey : "numero_portas") as! Int
     self.cor = aDecoder.decodeObject(forKey : "cor") as! String
     self.tipo_de_necessidade = aDecoder.decodeObject(forKey : "tipo_de_necessidade") as! String
     self.opcional = aDecoder.decodeObject(forKey : "opcional") as! String
     self.blindagem = aDecoder.decodeObject(forKey : "blindagem") as! String
     self.imagem1 = aDecoder.decodeObject(forKey : "imagem1") as! [UIImage]
     
     }
     */
    /**
     func encode(with aCoder: NSCoder) {
     
     aCoder.encode(id_anuncio ,forKey : "id_anuncio")
     aCoder.encode(id_veiculo_anuncio ,forKey : "id_veiculo_anuncio")
     aCoder.encode(id_anunciante ,forKey : "id_anunciante")
     aCoder.encode(marca ,forKey : "marca")
     aCoder.encode(tracao , forKey :"tracao")
     aCoder.encode(modelo ,forKey : "modelo")
     aCoder.encode(versao ,forKey : "versao")
     aCoder.encode(cambio ,forKey : "cambio")
     aCoder.encode(carroceria , forKey : "carroceria")
     aCoder.encode(tipo_veiculo ,forKey : "tipo_veiculo")
     aCoder.encode(tipoCombustivel ,forKey : "tipoCombustivel")
     aCoder.encode(ano_compra ,forKey : "ano_compra")
     aCoder.encode(kilometragem ,forKey : "kilometragem")
     aCoder.encode(preco ,forKey : "preco")
     aCoder.encode(final_placa ,forKey : "final_placa")
     aCoder.encode(numero_portas ,forKey : "numero_portas")
     aCoder.encode(cor ,forKey : "cor")
     aCoder.encode(tipo_de_necessidade ,forKey : "tipo_de_necessidade")
     aCoder.encode(opcional ,forKey : "opcional")
     aCoder.encode(blindagem ,forKey : "blindagem")
     aCoder.encode(imagem1, forKey : "imagem1")
     
     }
     
     */
    
    func details() -> String {
        var message = "Marca: \(marca) \n  Modelo: \(modelo)  \n Versão: \(versao)  \n  Carroceria: \(carroceria)  \n  Tipo do Veiculo: \(tipo_veiculo)  \n   Ano da Compra: \(ano_compra)  \n Kilometragem: \(kilometragem) \n Preço: \(preco) \n Final da Placa: \(final_placa) \n   Numero de Portas:\(numero_portas) \n Cor: \(cor) \n Tipo de necessidade \(tipo_de_necessidade) \n Informações: \(opcional) \n Blindagem: \(blindagem) \n \(tipoCombustivel) /n \(tracao)"
        
        
        return message
    }
}
