//
//  CrearCuenta.swift
//  Deaftionary
//
//  Created by user199132 on 27/10/2023.
//

import UIKit

class CrearCuentaViewController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var edadTextField: UITextField!
    @IBOutlet weak var sexoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    
    var client: SupabaseClient!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializa el cliente de Supabase
        let url = URL(string: "https://yqtxobflejsldbccylqo.supabase.co")!
        let key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlxdHhvYmZsZWpzbGRiY2N5bHFvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NzAwODkwMiwiZXhwIjoyMDEyNTg0OTAyfQ.wTRwAgqJ-B2QoJlyfS6s8o_g_YZCqD4Y-wfdIdHrsvM"
        self.client = SupabaseClient(supabaseURL: url, supabaseKey: key)
    }
    
    @IBAction func onContinuarButtonClick(_ sender: Any) {
        guard let nombre = nombreTextField.text,
              let apellido = apellidoTextField.text,
              let edad = edadTextField.text,
              let sexo = sexoTextField.text,
              let email = emailTextField.text,
              let contraseña = contraseñaTextField.text else {
            print("Por favor, complete todos los campos")
            return
        }
        
        let userData: [String: Any] = [
            "Nombre": nombre,
            "Apellido": apellido,
            "Edad": edad,
            "Sexo": sexo,
            "mail_usuario": email,
            "contrasena_usuario": contraseña
        ]
        
        registerUser(userData: userData)
        
        performSegue(withIdentifier: "Continuar", sender: nil)
    }
    
    func registerUser(userData: [String: Any]) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: userData)
            
            var request = URLRequest(url: URL(string: "https://yqtxobflejsldbccylqo.supabase.co/rest/v1/Usuarios")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlxdHhvYmZsZWpzbGRiY2N5bHFvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NzAwODkwMiwiZXhwIjoyMDEyNTg0OTAyfQ.wTRwAgqJ-B2QoJlyfS6s8o_g_YZCqD4Y-wfdIdHrsvM", forHTTPHeaderField: "Authorization")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error en la solicitud: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("Datos vacíos en la respuesta")
                    return
                }
                
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("Respuesta del servidor: \(jsonResponse)")
                    }
                } catch {
                    print("Error al parsear la respuesta JSON: \(error)")
                }
            }
            
            task.resume()
        } catch {
            print("Error al serializar datos JSON: \(error)")
        }
    }
}

