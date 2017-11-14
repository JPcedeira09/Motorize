//
//  ModeloAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class ModeloAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    var anuncio : Anuncio?
    @IBOutlet weak var modeloPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modeloPicker.dataSource = self
        modeloPicker.delegate = self
        session()
    }
    var MODELO = [Carro]()
    
    func session (){
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/anuncio/listaVersao/\((anuncio?.marca)!)/\((anuncio?.modelo)!)/\((anuncio?.tipo_veiculo)!)")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]{
                        var responses  : [Carro] = []
                        for response in json {
                            let estado = Carro(json: response)
                            responses.append(estado)
                        }
                        self.MODELO = responses
                        self.modeloPicker.dataSource = self
                        self.modeloPicker.delegate = self
                        self.modeloPicker.reloadAllComponents()
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if ( self.MODELO.isEmpty){
            return semConexao[row]
        }else{
            return MODELO[row].versao
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.MODELO.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (self.MODELO.isEmpty){
            print("nada")
        }else{
            var marcaEscolhida = MODELO[row].versao
            anuncio?.versao = marcaEscolhida
            print(marcaEscolhida)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            KilometragemAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
