//
//  ExtraAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class ExtraAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource ,UITextFieldDelegate{
    
    var anuncio : Anuncio?
    
    let semconexao = ["sem conexão"]
    
    let tipoBlindagem = ["tipo 1","tipo 2" , "tipo 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descricaoDeficiencia.isEditable = false
        descricaoDeficiencia.text = "Se sim. Qual?"
        pickerTipoBlindagem.isHidden = true
        textoInfo.isEditable = false
        pickerTipoBlindagem.delegate = self
        pickerTipoBlindagem.dataSource = self
    }
    
    @IBOutlet weak var pickerTipoBlindagem: UIPickerView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var switchBlindagem: UISwitch!
    @IBOutlet weak var switchDeficiencia: UISwitch!
    
    @IBOutlet weak var textoInfo: UITextView!
    
    @IBAction func blindagemFunc(_ sender: UISwitch) {
        
        if(switchBlindagem.isOn == true){
            anuncio?.blindagem = "Possui blindagem"
            pickerTipoBlindagem.isHidden = false
            
        }
        
        if(switchBlindagem.isOn == false){
            anuncio?.blindagem = "Não possui blindagem"
            pickerTipoBlindagem.isHidden = true
            
        }
    }
    
    @IBAction func deficienciaFunc(_ sender: UISwitch) {
        if(switchDeficiencia.isOn == true){
            descricaoDeficiencia.text = ""
            descricaoDeficiencia.isEditable = true
            anuncio?.tipo_de_necessidade = descricaoDeficiencia.text
        }
        
        if(switchDeficiencia.isOn == false){
            descricaoDeficiencia.text = "Se sim. Qual?"
            descricaoDeficiencia.isEditable = false
            anuncio?.tipo_de_necessidade = "Não possui deficiencia"
        }
    }
    @IBOutlet weak var descricaoDeficiencia: UITextView!
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if ( self.tipoBlindagem.isEmpty){
            return semconexao[row]
        }else{
            return tipoBlindagem[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.tipoBlindagem.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        anuncio?.blindagem = tipoBlindagem[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            ImagemAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
