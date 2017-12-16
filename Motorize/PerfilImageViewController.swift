//
//  PerfilImageViewController.swift
//  Motorize
//
//  Created by joao cedeira on 22/09/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class PerfilImageViewController: UIViewController ,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var anunciante : Anunciante?
    
    @IBOutlet weak var proximo: UIButton!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proximo.layer.borderWidth = 1
        proximo.layer.borderColor = UIColor.white.cgColor
        proximo.layer.cornerRadius = 10

        print(anunciante?.descrever())

        imagePicker.delegate = self
    }

    func Alert_MSG(titulo : String , menssagem : String){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func LibraryPicker(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        if imagePicker.sourceType == .photoLibrary{
 
            print("Imagens Acessadas")
        }else{
               Alert_MSG(titulo: "Alerta", menssagem: "Acesso Negado a Sua Imagens, Vá em Ajustes")
        }
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func CameraPicker(_ sender: UIButton) {
        imagePicker.allowsEditing = false
      if imagePicker.sourceType == .camera {
        print("Camera Acessada")

        }else{
             Alert_MSG(titulo: "Alerta", menssagem: "Acesso Negado a Sua Imagens, Vá em Ajustes")
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
         let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageProfile.image = pickedImage
        
        print("Escolheu")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewEstadoAdd = segue.destination as? PreviewCadastroViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        if let viewEstadoAdd = segue.destination as? EmailCadastroViewController {
            viewEstadoAdd.anunciante = anunciante
        }
        
    }
}
