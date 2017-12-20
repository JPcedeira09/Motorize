//
//  InicialViewController.swift
//  Motorize
//
//  Created by joao cedeira on 15/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class InicialViewController: UIViewController {
    
    @IBOutlet weak var acessarContaButton: UIButton!
    @IBOutlet weak var criarContaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        criarContaButton.layer.cornerRadius = 26
        acessarContaButton.layer.cornerRadius = 26
        acessarContaButton.layer.borderColor = UIColor.black.cgColor
        acessarContaButton.layer.borderWidth = 1
    }
    
    
    @IBAction func CriarConta(_ sender: UIButton) {
    }
    @IBAction func Acessar(_ sender: UIButton) {
    }
    
    @IBAction func FabookLogin(_ sender: UIButton) {
    }
    @IBAction func GoogleLogin(_ sender: UIButton) {
    }
    
    
    
}
