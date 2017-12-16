//
//  EnderecoViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class EnderecoViewController: UIViewController , UITextFieldDelegate{
    
    var anunciante : Anunciante?

    @IBOutlet weak var CEPField: UITextField!
    @IBOutlet weak var RUAField: UITextField!
    @IBOutlet weak var NUMField: UITextField!
    @IBOutlet weak var COMPLField: UITextField!
    
    @IBOutlet weak var proximo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        proximo.layer.borderWidth = 1
        proximo.layer.borderColor = UIColor.white.cgColor
        proximo.layer.cornerRadius = 10
 print(anunciante?.descrever())

        if(anunciante?.endereco.cep != ""){
            CEPField.text = anunciante?.endereco.cep
        }
        if(anunciante?.endereco.rua != ""){
            RUAField.text = anunciante?.endereco.rua
        }
        if(anunciante?.endereco.numero != ""){
            NUMField.text = anunciante?.endereco.numero
        }
        if(anunciante?.endereco.complemento != ""){
            COMPLField.text = anunciante?.endereco.complemento
        }
        CEPField.delegate = self
        RUAField.delegate = self
        NUMField.delegate = self
        COMPLField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(EnderecoViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(EnderecoViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as AnyObject).cgRectValue.height
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = -1 * keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = 0
            self.view.layoutIfNeeded()
        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CEPField.resignFirstResponder()
        RUAField.resignFirstResponder()
        NUMField.resignFirstResponder()
        COMPLField.resignFirstResponder()

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
        if CEPField.text == "" || CEPField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo CEP Não Foi Preenchido")
        }
        if RUAField.text == "" || RUAField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Rua Não Foi Preenchido")
        }
        if NUMField.text == "" || NUMField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Numero Não Foi Preenchido")
        }
        if COMPLField.text == "" || COMPLField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Complemento Não Foi Preenchido")
        }
        anunciante?.endereco.complemento = COMPLField.text!
        anunciante?.endereco.rua = RUAField.text!
        anunciante?.endereco.numero = NUMField.text!
        anunciante?.endereco.cep = CEPField.text!
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? EmailCadastroViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        if let viewEstadoAdd = segue.destination as? CidadeViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
    }
    

}
