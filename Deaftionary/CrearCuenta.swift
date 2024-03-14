//
//  CrearCuenta.swift
//  Deaftionary
//
//  Created by user199132 on 27/10/2023.
//

import UIKit



class  CrearCuentaViewController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var edadTextField: UITextField!
    @IBOutlet weak var sexoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onContinuarButtonClick (_sender: Any){
        performSegue(withIdentifier: "Continuar", sender: nil)
        
        func registerUser(username: String, password: String) {
            

            
            let userData: [String: Any] =
                ["nombre": nombreTextField!,
                 "apellido": apellidoTextField!,
                 "edad": edadTextField!,
                 "sexo": sexoTextField!,
                 "email": emailTextField!,
                 "contraseña": contraseñaTextField!,
            ]
            
            guard (try? JSONSerialization.data(withJSONObject: userData)) != nil else {
                print("Error al serializar datos JSON")
                return
            }
            guard URL(string: "https://yqtxobflejsldbccylqo.supabase.co") != nil else {
                   print("URL inválida")
                   return
               }
            
        }
    }
}

