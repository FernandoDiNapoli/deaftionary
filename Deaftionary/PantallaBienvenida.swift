//
//  PantallaBienvenida.swift
//  Deaftionary
//
//  Created by user199132 on 27/10/2023.
//

import UIKit

class PantallaBienvenida: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTraducirButtonClick(_sender: Any){
        performSegue(withIdentifier: "PantallaABCS", sender: nil)
    }
}
