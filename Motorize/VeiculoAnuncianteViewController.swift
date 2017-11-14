//
//  VeiculoAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class VeiculoAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    var anuncio : Anuncio?  
    var Veiculo = [Carro]()

    @IBOutlet weak var veiculoPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veiculoPicker.dataSource = self
        veiculoPicker.delegate = self
        session()
        self.veiculoPicker.reloadAllComponents()
    }
    
    func session(){
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string:"http://localhost:8088/motorizeApp1.1/motorize/anuncio/listaModelos/\((anuncio?.marca)!)/\((anuncio?.tipo_veiculo)!)")!
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
                    self.Veiculo = responses
                    self.veiculoPicker.dataSource = self
                    self.veiculoPicker.delegate = self
                    self.veiculoPicker.reloadAllComponents()
                    
                    for carro in self.Veiculo {
                        print(carro.modelo)
                    }
                }
            } catch {
                print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if ( self.Veiculo.isEmpty){
            return semConexao[row]
        }else{
            return Veiculo[row].modelo
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.Veiculo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (self.Veiculo.isEmpty){
            print("nada")
        }else{
             marcaEscolhida = Veiculo[row].modelo
            anuncio?.modelo = marcaEscolhida
            print(" a marca escolhida é \(anuncio?.modelo)")
        }
    }
    var marcaEscolhida : String = ""
    
    @IBAction func ProximoSegue(_ sender: Any) {
        anuncio?.modelo = marcaEscolhida
        print(" a marca escolhida é \(anuncio?.modelo)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        anuncio?.modelo = marcaEscolhida
        print(" a marca escolhida é \(anuncio?.modelo)")

        if let viewControllerEscolhaModelModelo = segue.destination as?
            ModeloAnuncianteViewController {
            anuncio?.modelo = marcaEscolhida

            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }

}
