//
//  PreviewCadastroViewController.swift
//  Motorize
//
//  Created by joao cedeira on 16/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PreviewCadastroViewController: UIViewController {
    
    var anunciante : Anunciante?
    
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
        
        editarNome.layer.borderColor = UIColor.black.cgColor
        editarCPF.layer.borderColor = UIColor.black.cgColor
        editarEmail.layer.borderColor = UIColor.black.cgColor
        editarTelefone.layer.borderColor = UIColor.black.cgColor
        editarCelular.layer.borderColor = UIColor.black.cgColor
        editarEndereco.layer.borderColor = UIColor.black.cgColor
        
        cadastrarButton.layer.borderWidth = 1
        cadastrarButton.layer.borderColor = UIColor.black.cgColor
        cadastrarButton.layer.cornerRadius = 2
        
        print(anunciante?.descrever())
        var cidade = (anunciante?.endereco.cidade.nome_cidade)!
        var estado = (anunciante?.endereco.estado.sigla)!
        enderecoCompleto = "\(cidade), \(estado)"
        
        var rua = (anunciante?.endereco.rua)!
        var numero = (anunciante?.endereco.numero)!
        var complemento = (anunciante?.endereco.complemento)!
        enderecoResidencial = "\(cidade), \(estado)"
        
        
        nomeLabel.text = " NOME: \((anunciante?.nome)!)"
        CPFLabel.text = " CPF: \((anunciante?.CPF)!)"
        EmailLabel.text = " EMAIL: \((anunciante?.email.email)!)"
        TelefoneLabel.text = " TELEFONE: \((anunciante?.telefone)!)"
        celularLabel.text = " CELULAR: \((anunciante?.celular)!)"
        estadoLabel.text = " ENDEREÇO: \(enderecoCompleto)"
        enderecoLabel.text = "  \(enderecoResidencial)"
        
        print(anunciante?.toJSON())
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
            self.anunciante?.email.email  = mail!
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
            self.anunciante?.endereco.rua  = rua!
            let numero = alertController.textFields?[1].text
            self.anunciante?.endereco.numero  = numero!
            let compl = alertController.textFields?[2].text
            self.anunciante?.endereco.complemento  = compl!
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
        
        let JSON = (anunciante?.toJSON())!
        let jsonData = try? JSONSerialization.data(withJSONObject: JSON )
        
        // create post request
        let url = URL(string: "http://localhost:8088/motorizeApp1.1/motorize/anunciante/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? PerfilImageViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
        
    }
    
}
