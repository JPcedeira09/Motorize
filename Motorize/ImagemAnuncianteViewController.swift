//
//  ImagemAnuncianteViewController.swift
//  Motorize
//
//  Created by joao cedeira on 05/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import UIKit

class ImagemAnuncianteViewController: UIViewController ,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    
    var anuncio : Anuncio?
    
    @IBOutlet weak var imagensDoCarro: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        // O info dictionary contem multiplas representações de " A image", E esse usa o orinal
        imagensDoCarro.image = UIImage(named: "default")
        
        // setando como a imagem selecionada como UIImage
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // setando aspect fit no esquadro da imagem
        imagensDoCarro.contentMode = .scaleAspectFit
        
        // setando photoImageView para o  display fazendo o  "selected image".
        imagensDoCarro.image = selectedImage
        
        //  carroEmSelecao?.imagem1 = selectedImage
        // anuncio?.imagem1.append(selectedImage)
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        print("escolheu foto")
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss o picker se o usuario cancelar a seleção.
        dismiss(animated: true, completion: nil)
        print("Cancelou a escolha de imagem")
    }
    
    @IBAction func Library(_ sender: UIBarButtonItem) {
        
        picker.allowsEditing = false
        
        picker.delegate = self
        
        if picker.sourceType == .photoLibrary {
            
            present(picker, animated: true, completion: nil)
            
            print("Library Acessada !")
            
        }else {
            
            let alert = UIAlertController(title: "Sem acesso", message: "Acesse Ajustes para permitir o acesso as fotos.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func Camera(_ sender: UIBarButtonItem) {
        
        picker.delegate = self
        
        picker.allowsEditing = false
        
        if picker.sourceType == .camera {
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
            print("Camera Acessada !")
            
        }else {
            
            let alert = UIAlertController(title: "Sem acesso", message: "Camera indusponivel, acesse ajustes para permitir o acesso.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerEscolhaModelModelo = segue.destination as?
            ValorAnuncianteViewController {
            viewControllerEscolhaModelModelo.anuncio = anuncio
        }
    }
}
