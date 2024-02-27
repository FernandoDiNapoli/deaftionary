//
//  CrearCuenta.swift
//  Deaftionary
//
//  Created by user199132 on 27/10/2023.
//

import UIKit

class  CrearCuentaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onContinuarButtonClick (_sender: Any){
        performSegue(withIdentifier: "Continuar", sender: nil)
    }

    
}

