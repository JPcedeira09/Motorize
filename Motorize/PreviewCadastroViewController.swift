//
//  PreviewCadastroViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit
import Alamofire

class PreviewCadastroViewController: UIViewController {
    
    var anunciante : Anunciante?
    var email : Email?
    var endereco : Endereco?
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var CPFLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var TelefoneLabel: UILabel!
    @IBOutlet weak var estadoLabel: UILabel!
    @IBOutlet weak var celularLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var editarNome: UIButton!
    @IBOutlet weak var editarCPF: UIButton!
    @IBOutlet weak var editarEmail: UIButton!
    @IBOutlet weak var editarTelefone: UIButton!
    @IBOutlet weak var editarCelular: UIButton!
    @IBOutlet weak var editarEndereco: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    var enderecoCompleto = ""
    var enderecoResidencial = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editarNome.layer.borderWidth = 1
        editarCPF.layer.borderWidth = 1
        editarEmail.layer.borderWidth = 1
        editarTelefone.layer.borderWidth = 1
        editarCelular.layer.borderWidth = 1
        editarEndereco.layer.borderWidth = 1
        
        editarNome.layer.cornerRadius = 10
        editarCPF.layer.cornerRadius = 10
        editarEmail.layer.cornerRadius = 10
        editarTelefone.layer.cornerRadius = 10
        editarCelular.layer.cornerRadius = 10
        editarEndereco.layer.cornerRadius = 10
        
        editarNome.layer.borderColor = UIColor.white.cgColor
        editarCPF.layer.borderColor = UIColor.white.cgColor
        editarEmail.layer.borderColor = UIColor.white.cgColor
        editarTelefone.layer.borderColor = UIColor.white.cgColor
        editarCelular.layer.borderColor = UIColor.white.cgColor
        editarEndereco.layer.borderColor = UIColor.white.cgColor
        
        cadastrarButton.layer.borderWidth = 1
        cadastrarButton.layer.borderColor = UIColor.white.cgColor
        cadastrarButton.layer.cornerRadius = 2
        
        print(anunciante?.descrever())
        var cidade = (endereco?.cidade.cidade)!
        var estado = (endereco?.estado.sigla)!
        enderecoCompleto = "\(cidade), \(estado)"
        
        var rua = (endereco?.rua)!
        var numero = (endereco?.numero)!
        var complemento = (endereco?.complemento)!
        enderecoResidencial = "\(cidade), \(estado)"
        
        
        nomeLabel.text = " NOME: \((anunciante?.nome)!)"
        CPFLabel.text = " CPF: \((anunciante?.CPF)!)"
        EmailLabel.text = " EMAIL: \((email?.email)!)"
        TelefoneLabel.text = " TELEFONE: \((anunciante?.telefone)!)"
        celularLabel.text = " CELULAR: \((anunciante?.celular)!)"
        estadoLabel.text = " ENDEREÇO: \(enderecoCompleto)"
        enderecoLabel.text = "  \(enderecoResidencial)"
        
        //print(anunciante?.toJSON())
    }
    
    func showInputDialog(titulo : String , msg : String) {
        let alertController = UIAlertController(title: titulo, message: msg, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            let email = alertController.textFields?[1].text
            
            // self.labelMessage.text = "Name: " + name! + "Email: " + email!
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Email"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editarNome(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar Nome", message: "Digite o novo nome.", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            //getting the input values from user
            let name = alertController.textFields?[0].text
            self.nomeLabel.text = "Nome: " + name!
            self.anunciante?.nome  = name!
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Nome..."
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func editarCPF(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar CPF", message: "Digite o novo CPF.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            //getting the input values from user
            let CPF = alertController.textFields?[0].text
            self.CPFLabel.text = "CPF: " + CPF!
            self.anunciante?.CPF  = CPF!
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "CPF..."
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editarEmail(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar Email", message: "Digite o novo email.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            //getting the input values from user
            let mail = alertController.textFields?[0].text
            self.EmailLabel.text = "Email: " + mail!
            self.email?.email  = mail!
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Email..."
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editarTelefone(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar Telefone", message: "Digite o novo Telefone.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            //getting the input values from user
            let fone = alertController.textFields?[0].text
            self.TelefoneLabel.text = "Telefone: " + fone!
            self.anunciante?.telefone  = fone!
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Telefone..."
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editarCelular(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar Celular", message: "Digite o novo celular.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            //getting the input values from user
            let cel = alertController.textFields?[0].text
            self.celularLabel.text = "Celular: " + cel!
            self.anunciante?.celular  = cel!
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Celular..."
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editarEndereco(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Mudar Endeço", message: "Digite o novo Endereço.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Alterar", style: .default) { (_) in
            var endereco = ""
            
            //getting the input values from user
            let rua = alertController.textFields?[0].text
            self.endereco?.rua  = rua!
            var numero = alertController.textFields?[1].text
            self.endereco?.numero  = numero!
            let compl = alertController.textFields?[2].text
            self.endereco?.complemento  = compl!
            endereco = "Endereço:\(rua!),\(numero!),\(compl!)"
            self.enderecoLabel.text = endereco
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Rua..."
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Numero..."
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Complemento..."
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func Cadastrar(_ sender: Any) {
        print(anunciante)
        cadastroAnunciante( anunciante!)
    }
    
    func cadastroAnunciante( _ user: Anunciante){
        let parametros : [String: Any]  = user.toDict(user) as [String:Any]
        let postURL = URL(string:  "http://localhost:8088/motorizeApp1.2/motorize/anunciante/adicionarAnunciante")
        
          let header = ["Content-Type" : "application/json"]
        
        Alamofire.request(postURL!, method: .post, parameters:parametros , encoding: JSONEncoding.default,headers: header).validate(contentType: ["application/json"]).responseJSON {  response in
            print(response)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? PerfilImageViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
        
    }
    
}
