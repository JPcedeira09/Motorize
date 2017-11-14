
//
//  EstadoViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class EstadoViewController: UIViewController ,UIPickerViewDelegate , UIPickerViewDataSource{
    
    var id_estado :Int = 0
    var sigla : String = ""
    var estado : String = ""
    
    @IBOutlet weak var proximo: UIButton!
    
    var anunciante : Anunciante?
    
    @IBOutlet weak var pickerEstados: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print(anunciante?.descrever())

        session()
        self.pickerEstados.reloadAllComponents()

        for estado in self.ESTADOS{
            print("\(estado.estado) com ID: \(estado.id_estado)")
        }
        proximo.layer.borderWidth = 1
        proximo.layer.borderColor = UIColor.black.cgColor
        proximo.layer.cornerRadius = 10
}
    var ESTADOS = [Estado]()
    
    func session (){
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/endereco/listarEstados")!
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {   do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]{
                    var responses  : [Estado] = []
                    for response in json {
                        let estado = Estado(json: response)
                        responses.append(estado)
                    }
                    self.ESTADOS = responses
                    self.pickerEstados.dataSource = self
                    self.pickerEstados.delegate = self
                self.pickerEstados.reloadAllComponents()
                }
            } catch {
                print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ESTADOS.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ESTADOS[row].estado
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if ( ESTADOS.isEmpty) {
            
            print("nada")
        }else {
            id_estado = ESTADOS[row].id_estado
            sigla = ESTADOS[row].sigla
            estado = ESTADOS[row].estado
        }
    }
    
    @IBAction func SegueProximo(_ sender: UIButton) {
        anunciante?.endereco.estado.sigla = sigla
        anunciante?.endereco.estado.estado = estado
        anunciante?.endereco.estado.id_estado = id_estado
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? CidadeViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        if let viewEstadoAdd = segue.destination as? PessoaisViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
    }
    
}