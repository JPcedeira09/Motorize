//
//  AnoAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class AnoAnuncianteViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let semConexao = ["sem conexão"]
    
    var anuncio : Anuncio?
    var anoEscolhido : String = ""
    
    var arrayAno = ["1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017"]
    
    @IBOutlet weak var anoPicker : UIPickerView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    anoEscolhido = arrayAno[0]
    anoPicker.dataSource = self
    anoPicker.delegate = self
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if ( self.arrayAno.isEmpty){
    
    return semConexao[row]
    
    }else{
    return arrayAno[row]
    
    }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return self.arrayAno.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     anoEscolhido = arrayAno[row]
    
    let ano = anoEscolhido
    
    // anuncio?.ano_compra = ano
    
    print(anoEscolhido)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let viewControllerEscolhaModelModelo = segue.destination as?
    CambioAnuncianteViewController {
    viewControllerEscolhaModelModelo.anuncio = anuncio
    }
    }


}
