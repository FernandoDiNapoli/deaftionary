//
//  PantallaABCViewController.swift
//  Deaftionary
//
//  Created by user199132 on 27/02/2024.
//

import UIKit

class PantallaABCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onVolverButtonClick(_sender:Any){
      performSegue(withIdentifier: "VolverABienvenida", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
