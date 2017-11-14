//
//  CarroceriaAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class CarroceriaAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    var anuncio : Anuncio?
    var arrayCarroceria = ["Sedan","Hatch","Jipe","Picape","Coupé","Cupé","Conversivel"]
    var carroceriaEscolhida : String = ""
    @IBOutlet weak var carroceriPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carroceriaEscolhida = arrayCarroceria[0]
        carroceriPicker.dataSource = self
        carroceriPicker.delegate = self
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayCarroceria.isEmpty){
            return semConexao[row]
        }else{
            return arrayCarroceria[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayCarroceria.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        carroceriaEscolhida = arrayCarroceria[row]
        anuncio?.carroceria = carroceriaEscolhida
        print(carroceriaEscolhida)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            PortaAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
    
}
