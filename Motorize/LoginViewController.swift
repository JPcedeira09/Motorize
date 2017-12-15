//
//  LoginViewController.swift
//  Motorize
//
//  Created by joao cedeira on 15/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    var anunciante : Anunciante?

    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 26
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as AnyObject).cgRectValue.height
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = -1 * keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
    func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = 0
            self.view.layoutIfNeeded()
        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CPF.resignFirstResponder()
        senha.resignFirstResponder()

        return true
    }
    
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var CPF: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    @IBAction func Login(_ sender: UIButton) {
        login(CPF: CPF.text!, senha: senha.text!)
        if anunciante?.nome == "" || anunciante?.nome == nil {
        return
        }
    }
    
    func login (CPF : String  , senha: String) {
        let configuracao = URLSessionConfiguration.default // Padrao de configuração.
        let sessao = URLSession(configuration: configuracao)
        var url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/acesso/logar/"+CPF+"/"+senha)
        print(url!)
        let task = sessao.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]{
                        let RESPONSE = Anunciante(anuncianteJSON: json)
                        print(RESPONSE.nome)
                        print(json)
                        self.anunciante = RESPONSE
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            if let destinationVC = segue.destination as? HomeViewController {
                destinationVC.anunciante = anunciante
            }
        }
    }
}


