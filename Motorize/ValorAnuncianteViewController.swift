
//
//  ValorAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class ValorAnuncianteViewController: UIViewController {

    var anuncio : Anuncio?
    
    @IBOutlet weak var valorAnuncio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anuncio?.preco = 0.0
    }
    @IBOutlet weak var mediaAnunciada: UILabel!
    
    @IBOutlet weak var valorTabelaFIPE: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            ExtraAnuncianteViewController {
            anuncio?.preco = Double(valorAnuncio.text!)!
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }

}
