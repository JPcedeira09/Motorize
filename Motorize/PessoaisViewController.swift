
//
//  PessoaisViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PessoaisViewController: UIViewController {
    
    // Propert
    var kbHeight: CGFloat!
    var anunciante : Anunciante?
    var endereco : Endereco?
    var email : Email?
    let sexos = ["Masculino","Feminino"]

    //Outlets
    @IBOutlet weak var nomeCompletoField: UITextField!
    @IBOutlet weak var ConfCPF: UITextField!
    @IBOutlet weak var CPFField: UITextField!
    @IBOutlet weak var SenhaField: UITextField!
    @IBOutlet weak var ConfSenha: UITextField!
    @IBOutlet weak var TelefoneField: UITextField!
    @IBOutlet weak var CelularField: UITextField!
    @IBOutlet weak var pickerSexo: UIPickerView!
    @IBOutlet weak var proximo: UIButton!
    @IBOutlet weak var segmentedPessoa: UISegmentedControl!
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var estado = Estado(id_estado: 0, sigla: "", estado: "")
        var cidade = Cidade(id_estado: 0, id_cidade: 0, cidade: "")
        endereco = Endereco(id_endereco: 0, estado: estado, cidade: cidade, cep: "", rua: "", numero: "", complemento: "", bairro: "", id_pessoa: 0)
        email = Email(id_email: 0, email: "", id_anunciante: 0)
        anunciante = Anunciante(id_pessoa: 0, nome: "", CPF: "", senha: "", celular: "", telefone: "", tipo_pessoa: "", status: "N")
        
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
        
    @IBAction func SegmentedControl(_ sender: Any) {
        switch segmentedPessoa.selectedSegmentIndex {
        case 0:
            anunciante?.tipo_pessoa = "Pessoa Fisica"
        case 1 :
            anunciante?.tipo_pessoa = "Pessoa Juridica"
        default:
            anunciante?.tipo_pessoa = "Pessoa Fisica"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        print(anunciante?.nome as Any)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? EstadoViewController {
            viewEstadoAdd.anunciante = anunciante
            viewEstadoAdd.endereco = endereco
            viewEstadoAdd.email = email
        }
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
    
    func Alert_MSG(titulo : String , menssagem : String){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension PessoaisViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    
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
}

extension PessoaisViewController : UITextFieldDelegate {
    
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
}
