//
//  PortaAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PortaAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    
    var arrayPortas = ["1","2","3","4"]
    
    @IBOutlet weak var portasPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portasPicker.dataSource = self
        portasPicker.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayPortas.isEmpty){
            
            return semConexao[row]
            
        }else{
            return arrayPortas[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayPortas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let portasEscolhida = arrayPortas[row]
        
        let portas = Int(portasEscolhida)
        anuncio?.numero_portas = portas!
        
        print(portasEscolhida)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            ValorAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
