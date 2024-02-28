//
//  PantallaLoginViewController.swift
//  Deaftionary
//
//  Created by user199132 on 20/02/2024.
//

import UIKit

class PantallaLoginViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginButtonClick(_sender: Any){
        let usuario = usuarioTextField.text
        let contraseña = contraseñaTextField.text
        
        if usuario == "Fernando" && contraseña == "12345"{
            loginOk()
        } else {
            error()
        }
    }
    
   @IBAction func
   onCrearUsuarioButtonClick(_sender: Any){
    performSegue(withIdentifier: "CrearCuenta", sender: nil)
   }
    
    func loginOk(){
        UserDefaults.standard.set(usuarioTextField.text,forKey: "usuario")
        performSegue(withIdentifier: "toPantallaBienvenida", sender: nil)
    }
    
    func error(){
        usuarioTextField.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0, alpha: 1)
        contraseñaTextField.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0, alpha: 1)
        
}

}
