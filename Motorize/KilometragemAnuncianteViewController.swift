//
//  KilometragemAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class KilometragemAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    
    var arrayKilometragem = ["0.000 e 5.000","5.000 e 10.000","10.000 e 15.000","15.000 e 20.000","20.000 e 25.000","25.000 e 30.000","30.000 e 35.000","35.000 e 40.000","40.000 e 45.000","45.000 e 50.000","50.000 e 55.000","55.000 e 60.000","60.000 e 65.000","65.000 e 70.000","70.000 e 75.000","75.000 e 80.000","80.000 e 85.000","85.000 e 90.000","90.000 e 95.000","95.000 e 100.000","100.000 e 105.000","105.000 e 110.000","110.000 e 115.000","115.000 e 120.000","120.000 e 125.000","125.000 e 130.000","130.000 e 135.000","135.000 e 140.000","140.000 e 145.000","145.000 e 150.000","150.000 e 155.000","155.000 e 160.000","160.000 e 165.000","165.000 e 170.000","170.000 e 175.000","175.000 e 180.000","180.000 e 185.000","185.000 e 190.000","190.000 e 195.000","195.000 e 200.000","200.000 e 205.000","205.000 e 210.000","210.000 e 215.000","215.000 e 220.000","220.000 e 225.000","225.000 e 230.000","230.000 e 235.000","235.000 e 240.000","240.000 e 245.000","245.000 e 250.000","250.000 e 255.000","255.000 e 260.000","260.000 e 265.000","265.000 e 270.000","270.000 e 275.000","275.000 e 280.000","280.000 e 285.000","285.000 e 290.000","290.000 e 295.000","295.000 e 300.000","300.000 e 305.000"]
    var kilometragemEscolhida : String = ""
    @IBOutlet weak var kilometragemPicker : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kilometragemEscolhida = arrayKilometragem[0]
        kilometragemPicker.dataSource = self
        kilometragemPicker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.arrayKilometragem.isEmpty){
            return semConexao[row]
        }else{
            return arrayKilometragem[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayKilometragem.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let kilometragemEscolhida = arrayKilometragem[row]
        anuncio?.kilometragem = kilometragemEscolhida
        print((anuncio?.kilometragem)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            CombustivelViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }

}
