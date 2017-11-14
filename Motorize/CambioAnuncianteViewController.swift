//
//  CambioAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class CambioAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    var anuncio : Anuncio?
    var arrayCambio = ["Automatico","Manual"]
    var cambioEscolhido : String = ""
    @IBOutlet weak var cambioPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cambioEscolhido = arrayCambio[0]
        cambioPicker.dataSource = self
        cambioPicker.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayCambio.isEmpty){
            return semConexao[row]
        }else{
            return arrayCambio[row]
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayCambio.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         cambioEscolhido = arrayCambio[row]
        anuncio?.cambio = cambioEscolhido
        print(cambioEscolhido)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            PlacaAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }

}
