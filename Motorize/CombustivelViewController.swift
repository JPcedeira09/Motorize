//
//  CombustivelViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class CombustivelViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    
    var arrayCombustivel = ["Gasolina","Diesel", "Hibrido" , "Gasolina/Álcool"]
    var  tipoCombustivel : String = ""
    @IBOutlet weak var combustivelPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipoCombustivel = arrayCombustivel[0]
        combustivelPicker.dataSource = self
        combustivelPicker.delegate = self
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayCombustivel.isEmpty){
            return semConexao[row]
        }else{
            return arrayCombustivel[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayCombustivel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        tipoCombustivel = arrayCombustivel[row]
        anuncio?.tipoCombustivel = tipoCombustivel
        print(tipoCombustivel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            TracaoAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }}
