
//
//  PessoaisViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PessoaisViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var nomeCompletoField: UITextField!
    @IBOutlet weak var ConfCPF: UITextField!
    @IBOutlet weak var CPFField: UITextField!
    @IBOutlet weak var SenhaField: UITextField!
    @IBOutlet weak var ConfSenha: UITextField!
    @IBOutlet weak var TelefoneField: UITextField!
    @IBOutlet weak var CelularField: UITextField!
    var kbHeight: CGFloat!
    var anunciante : Anunciante?
    
    @IBOutlet weak var proximo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ESTADO = Estado(id_estado: 0, sigla: "", estado: "")
        var CIDADE = Cidade(id_estado: 0, id_cidade: 0, cidade: "")
        var ENDERECO = Endereco(id_endereco: 0, estado: ESTADO, cidade: CIDADE, cep: "", rua: "", numero: "", complemento: "", bairro: "", id_pessoa: 0)
        var email = Email(id_email: 0, email: "", id_anunciante: 0)
        anunciante = Anunciante(id_pessoa: 0, nome: "", CPF: "", senha: "", endereco: ENDERECO, celular: "", telefone: "", email: email, tipo_pessoa: "", status: "")
        
        nomeCompletoField.delegate = self
        CPFField.delegate = self
        ConfCPF.delegate = self
        SenhaField.delegate = self
        ConfSenha.delegate = self
        TelefoneField.delegate = self
        CelularField.delegate = self
        pickerSexo.dataSource = self
        pickerSexo.delegate = self
        
        if(anunciante?.nome != ""){
        nomeCompletoField.text = anunciante?.nome
        }
        if(anunciante?.CPF != ""){
            CPFField.text = anunciante?.CPF
            ConfCPF.text = anunciante?.CPF
        }
        if(anunciante?.senha != ""){
            SenhaField.text = anunciante?.senha
            ConfSenha.text = anunciante?.senha
        }
        if(anunciante?.telefone != ""){
            TelefoneField.text = anunciante?.telefone
        }
        if(anunciante?.celular != ""){
            CelularField.text = anunciante?.celular
        }
   
        
        proximo.layer.borderWidth = 1
        proximo.layer.cornerRadius = 10
        proximo.layer.borderColor = UIColor.white.cgColor

        NotificationCenter.default.addObserver(self, selector: #selector(PessoaisViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(PessoaisViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    @objc  func keyboardWillShow(notification: NSNotification) {
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
        nomeCompletoField.resignFirstResponder()
        CPFField.resignFirstResponder()
        ConfCPF.resignFirstResponder()
        SenhaField.resignFirstResponder()
        ConfSenha.resignFirstResponder()
        TelefoneField.resignFirstResponder()
        CelularField.resignFirstResponder()
        return true
    }
    
    
    @IBOutlet weak var segmentedPessoa: UISegmentedControl!
    @IBAction func SegmentedControl(_ sender: Any) {
        switch segmentedPessoa.selectedSegmentIndex {
        case 0:
            
            anunciante?.tipo_pessoa = "Pessoa Fisica"
        case 1 :
            anunciante?.tipo_pessoa = "Pessoa Juridica"
        default:
            break;
        }
    }
    
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!
    
    let sexos = ["Masculino","Feminino"]
    @IBOutlet weak var pickerSexo: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //anunciante.sexo = sexos[row]
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
        
        if nomeCompletoField.text == "" || nomeCompletoField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Nome Completo Não Foi Preenchido")
        }
        if CPFField.text == "" || CPFField.text == nil {
            Alert_MSG(titulo: "Preencha Todos Os Campos", menssagem: "O Campo CPF  Não Foi Preenchido")
        }
        if ConfCPF.text == "" || CPFField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Confirme seu CPF Não Foi Preenchido")
        }
        if SenhaField.text == "" || SenhaField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Senha Não Foi Preenchido")
        }
        if ConfSenha.text == "" || ConfSenha.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Confirme Sua Senha Não Foi Preenchido")
        }
        if TelefoneField.text == "" || TelefoneField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Telefone Não Foi Preenchido")
        }
        if nomeCompletoField.text == "" || nomeCompletoField.text == nil {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "O Campo Celular Não Foi Preenchido")
        }

        if SenhaField.text != ConfSenha.text  {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "Por Favor, Digite Novamente Suas Senhas, Senhas Divergentes")
        }
        if CPFField.text != ConfCPF.text  {
            Alert_MSG(titulo: "Preencha Todos os Campos", menssagem: "Por Favor, Digite Novamente Seu CPF, CPF Divergente")
        }
        anunciante?.nome = nomeCompletoField.text!
        anunciante?.CPF = CPFField.text!
        anunciante?.senha = SenhaField.text!
        anunciante?.telefone = TelefoneField.text!
        anunciante?.celular = CelularField.text!
        print(anunciante?.nome)
    }
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? EstadoViewController {
            viewEstadoAdd.anunciante = anunciante
        }
    }
    
}
