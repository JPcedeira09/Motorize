//
//  MarcaAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class MarcaAnuncianteViewController: UIViewController , UIPickerViewDataSource ,UIPickerViewDelegate{
    
    var anuncio : Anuncio?
    var marcaEscolhida : String = ""
    let semConexao = ["sem conexão"]
    
    @IBOutlet weak var pickerMarca: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anuncio = Anuncio(numeroLikes: 0, tracao: "traseira", tipoCombustivel: "gasolina", id_anuncio: 0, id_veiculo_anuncio: 0, id_anunciante: 0, marca: "nenhuma", modelo: "nenhum", versao: "nenhum", carroceria: "nenhum", tipo_veiculo: "nenhum", ano_compra: "2000", kilometragem: "0.0", preco: 0.0, final_placa: 0, cambio: "", numero_portas: 0, cor: "nenhum", tipo_de_necessidade: "sem", opcional: "sem", blindagem: "sem")
        
        self.pickerMarca.delegate = self
        self.pickerMarca.dataSource = self
        
        session()
    }
    
    var MARCAS = [Carro]()
    
    func session (){
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/anuncio/listaMarcas/\((anuncio?.tipo_veiculo)!)")!
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]{
                    var responses  : [Carro] = []
                    for response in json {
                        let carru = Carro(json: response)
                        responses.append(carru)
                    }
                    self.MARCAS = responses
                    self.pickerMarca.dataSource = self
                    self.pickerMarca.delegate = self
                    self.pickerMarca.reloadAllComponents()
                }
            } catch {
                print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
    func alert (){
        let alert = UIAlertController(title: "Alerta", message: "Selecione todas as caracteristicas do seu carro para um anuncio mais coerente", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.MARCAS.isEmpty){
            return semConexao[row]
        }else{
            return MARCAS[row].marca
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.MARCAS.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (self.MARCAS.isEmpty){
            print("nada")
        }else{
            marcaEscolhida = MARCAS[row].marca
            anuncio?.marca = marcaEscolhida
            print("marca ecolhida\(anuncio?.marca)")
        }
    }
    @IBAction func Proximo(_ sender: Any) {
        anuncio?.marca = marcaEscolhida
        print("marca ecolhida\(anuncio?.marca)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("marca ecolhida\(anuncio?.marca)")

        if let viewControllerEscolhaModelModelo = segue.destination as? VeiculoAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
