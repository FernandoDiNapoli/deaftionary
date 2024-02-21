//
//  CrearCuenta.swift
//  Deaftionary
//
//  Created by user199132 on 27/10/2023.
//

import UIKit

class CrearCuenta: UIViewController {
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var edadTextField: UITextField!
    @IBOutlet weak var sexoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onContinuarButtonClick(_sender: Any)
    {
        let nombre = nombreTextField.text
        let apellido = apellidoTextField
        let edad = edadTextField
        let sexo = sexoTextField
        let email = emailTextField
        let contraseña = contraseñaTextField
        
   
        }
        
    }
    
