//
//  RedefinirSenhaViewController.swift
//  Motorize
//
//  Created by joao cedeira on 25/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class RedefinirSenhaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alert_MSG(titulo: "Redefinição de Senha", menssagem: "Digite seu email, para aonde será enviado sua nova senha")    }
    func Alert_MSG(titulo : String , menssagem : String){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
