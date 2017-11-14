//
//  TracaoAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class TracaoAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    
    var arrayTracao = ["Traseira", "Dianteira","4x4"]
    
    @IBOutlet weak var tracaPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracaPicker.dataSource = self
        tracaPicker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayTracao.isEmpty){
            return semConexao[row]
        }else{
            return arrayTracao[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayTracao.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let tracaoEscolhida = arrayTracao[row]
        
        anuncio?.tracao = tracaoEscolhida
        
        print(tracaoEscolhida)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            AnoAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
