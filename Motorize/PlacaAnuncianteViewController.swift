//
//  PlacaAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PlacaAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    var anuncio : Anuncio?
    var arrayFimPlaca = ["0","1","2","3","4","5","6","7","8","9"]
    var placaEscolhida : String = "0"
    @IBOutlet weak var finalPlacaPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placaEscolhida = arrayFimPlaca[0]
        finalPlacaPicker.dataSource = self
        finalPlacaPicker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayFimPlaca.isEmpty){
            return semConexao[row]
        }else{
            return arrayFimPlaca[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayFimPlaca.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placaEscolhida = arrayFimPlaca[row]
        let placa = Int(placaEscolhida)
        anuncio?.final_placa = placa!
        print(placaEscolhida)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            CarroceriaAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
    
}
