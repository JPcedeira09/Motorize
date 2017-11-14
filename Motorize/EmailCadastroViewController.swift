//
//  EmailCadastroViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class EmailCadastroViewController: UIViewController , UITextFieldDelegate{
    
    var anunciante : Anunciante?
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var CONFField: UITextField!
    
    @IBOutlet weak var proximo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print((anunciante?.descrever())!)
        proximo.layer.borderWidth = 1
        proximo.layer.borderColor = UIColor.black.cgColor
        proximo.layer.cornerRadius = 10

        if(anunciante?.email.email != ""){
            EmailField.text = anunciante?.email.email
            CONFField.text = anunciante?.email.email
        }
        
        EmailField.delegate = self
        CONFField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(EmailCadastroViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(EmailCadastroViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
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
        
        EmailField.resignFirstResponder()
        CONFField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)

    }
    
    func Alert_MSG(titulo : String , menssagem : String){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func SegueProximo(_ sender: UIButton) {
        
        if EmailField.text == "" || EmailField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Email Não Foi Preenchido")
        }
        if CONFField.text == "" || CONFField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Confirme Seu Email Não Foi Preenchido")
        }
        if CONFField.text != EmailField.text {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "Por Favor, Digite Novamente Seu Email, Emails Divergentes")
        }
        anunciante?.email.email = EmailField.text!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? PerfilImageViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        if let viewEstadoAdd = segue.destination as? EnderecoViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
    }
}
