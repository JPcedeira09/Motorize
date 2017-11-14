//
//  TipoVeiculoViewController.swift
//  Motorize
//
//  Created by joao cedeira on 10/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class TipoVeiculoViewController: UIViewController , UIPickerViewDataSource ,UIPickerViewDelegate{
    
    var anuncio : Anuncio?
    var tipo_Veiculo : String = "moto"
    let semConexao = ["sem conexão"]
    
    @IBOutlet weak var pickerTipoVeiculo: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anuncio = Anuncio(numeroLikes: 0, tracao: "traseira", tipoCombustivel: "gasolina", id_anuncio: 0, id_veiculo_anuncio: 0, id_anunciante: 0, marca: "nenhuma", modelo: "nenhum", versao: "nenhum", carroceria: "nenhum", tipo_veiculo: "nenhum", ano_compra: "2000", kilometragem: "0.0", preco: 0.0, final_placa: 0, cambio: "", numero_portas: 0, cor: "nenhum", tipo_de_necessidade: "sem", opcional: "sem", blindagem: "sem")
        
        self.pickerTipoVeiculo.delegate = self
        self.pickerTipoVeiculo.dataSource = self
        
    }
    
    var tipoVeiculo : [String] = ["moto"," carro"]
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.tipoVeiculo.isEmpty){
            return semConexao[row]
        }else{
            return tipoVeiculo[row]
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.tipoVeiculo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (self.tipoVeiculo.isEmpty){
            print("nada")
        }else{
            tipo_Veiculo = tipoVeiculo[row]
            anuncio?.tipo_veiculo = tipo_Veiculo
            print("marca ecolhida\(anuncio?.tipo_veiculo)")
        }
    }
    @IBAction func Proximo(_ sender: Any) {
        anuncio?.tipo_veiculo = tipo_Veiculo
        print("tipo_veiculo ecolhido\(anuncio?.tipo_veiculo)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("tipo_veiculo ecolhido\(anuncio?.tipo_veiculo)")
        
        if let viewControllerEscolhaModelModelo = segue.destination as? MarcaAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
    
}
