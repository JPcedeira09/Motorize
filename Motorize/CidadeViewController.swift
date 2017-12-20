//
//  CidadeViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit
import Alamofire

class CidadeViewController: UIViewController {
    
    var anunciante : Anunciante?
    var endereco : Endereco?
    var email : Email?
    
    var id_cidade :Int = 0
    var id_estado : Int = 0
    var nome_cidade : String = ""
    var CIDADES = [Cidade]()

    @IBOutlet weak var pickerCidade: UIPickerView!
    @IBOutlet weak var proximo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(anunciante?.descrever())
        proximo.layer.borderWidth = 1
        proximo.layer.borderColor = UIColor.white.cgColor
        proximo.layer.cornerRadius = 10
        print("O ID do estado é:"+"\(endereco?.estado.id_estado)")
        getEstados()
    }
    
    @IBAction func SegueProximo(_ sender: UIButton) {
        endereco?.cidade.id_cidade = id_cidade
        endereco?.cidade.id_estado = id_estado
        endereco?.cidade.cidade = nome_cidade
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? EnderecoViewController {
            viewEstadoAdd.anunciante = anunciante
            viewEstadoAdd.endereco = endereco
            viewEstadoAdd.email = email
            
        }
        if let viewEstadoAdd = segue.destination as? EstadoViewController {
            viewEstadoAdd.anunciante = anunciante
            viewEstadoAdd.endereco = endereco
            viewEstadoAdd.email = email        }
    }
    
    func getEstados (){
        Alamofire.request(
            URL(string: "http://localhost:8088/motorizeApp1.2/motorize/filter/BuscarCidades/\((endereco?.estado.id_estado)!)")!,
            method: .get)
            .validate()
            .responseJSON { (response) -> Void in
                switch response.result {
                case .success:
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [[String: Any]]{
                            var responses  : [Cidade] = []
                            for response in json {
                                let cidade = Cidade(json: response)
                                responses.append(cidade)
                            }
                            self.CIDADES = responses
                            self.pickerCidade.dataSource = self
                            self.pickerCidade.delegate = self
                            self.pickerCidade.reloadAllComponents()
                        }
                    
                    } catch {
                        print("error in JSONSerialization")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
}

extension CidadeViewController : UIPickerViewDelegate , UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CIDADES.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CIDADES[row].cidade
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if ( CIDADES.isEmpty) {
            print("nada")
        }else {
            id_cidade = CIDADES[row].id_cidade
            id_estado = CIDADES[row].id_estado
            nome_cidade = CIDADES[row].cidade
        }
    }
}

/**
 func session(){
 let config = URLSessionConfiguration.default // Session Configuration
 let session = URLSession(configuration: config) // Load configuration into Session
 var url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/endereco/getCidades/"+"\((anunciante?.endereco.estado.id_estado)!)")
 print(url!)
 let task = session.dataTask(with: url!, completionHandler: {
 (data, response, error) in
 if error != nil {
 print(error!.localizedDescription)
 } else {   do {
 if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]{
 var responses  : [Cidade] = []
 for response in json {
 let cidade = Cidade(json: response)
 responses.append(cidade)
 //print(carroResponse.nome_cidade)
 }
 self.CIDADES = responses
 self.pickerCidade.dataSource = self
 self.pickerCidade.delegate = self
 self.pickerCidade.reloadAllComponents()
 
 for cidade in self.CIDADES {
 print(cidade.nome_cidade)
 }
 
 }
 } catch {
 print("error in JSONSerialization")
 }
 }
 })
 task.resume()
 }
 */
