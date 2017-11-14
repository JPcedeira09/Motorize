//
//  VersaoAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class VersaoAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    
    var arrayVersao  = ["GOL Comfort 2013","GOLF Turbo 2014","JETTA 2.5 versao 2015","PALIO 1.0 2005","HB20 2014","HB20 X 2016","IX35 2016"," GRAND SANTA FÉ 2015"]
    
    @IBOutlet weak var versaoPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        versaoPicker.dataSource = self
        versaoPicker.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayVersao.isEmpty){
            
            return semConexao[row]
            
        }else{
            return arrayVersao[row]
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayVersao.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let marcaEscolhida = arrayVersao[row]
        
        anuncio?.versao = marcaEscolhida
        
        print(marcaEscolhida)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            KilometragemAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
