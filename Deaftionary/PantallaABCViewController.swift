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
    
    // Outlet para el UITextField
    @IBOutlet weak var textField: UITextField!
    
    // Outlet para el UIView que contendrá las imágenes
    @IBOutlet weak var imagesContainerView: UIView!
    
    // Acción del botón
    @IBAction func ontranslateButtonClick(_ sender: UIButton) {
        guard let text = textField.text else { return }
        updateImages(for: text)
    }
    
    // Diccionario que mapea letras a URLs de imágenes
    let letterToImageURL: [Character: String] = [
        "a": "https://drive.google.com/file/d/1Gd1niW2LoIaWk5f4U68WzjYaGCstX5kd/view?usp=sharing",
        "b": "https://drive.google.com/file/d/1aXOLleum_jau7iyn2JH8Q9Bk8iud_gG1/view?usp=sharing",
        "c": "https://drive.google.com/file/d/1JZivLJ1CjscGz0UGcZ-Jk1HCubG56ItM/view?usp=sharing",
        "d": "https://drive.google.com/file/d/19Nz1S3YvEEIYjW6LFg9GB89R8Qx-OaJs/view?usp=sharing",
        "e": "https://drive.google.com/file/d/1JAe-nWuFg8nzmzKHUR5hJLwU6X2QC2w8/view?usp=sharing",
        "f": "https://drive.google.com/file/d/1WfYazlE1UY9p_rrUYQkaV5_Sj0-LkCXR/view?usp=sharing",
        "g": "https://drive.google.com/file/d/1ZigNRxad25L7aVOgxfUh8Y27pgucYzox/view?usp=sharing",
        "h": "https://drive.google.com/file/d/1edUl2JOjQ9QHNN_8FIMRb4f4YYRx2z3e/view?usp=sharing",
        "i": "https://drive.google.com/file/d/1YqWtCLxKEHX-r0KhoIVphvawg6_MHCA9/view?usp=sharing",
        "j": "https://drive.google.com/file/d/1F2DgbE-O-4dj9L91Ser1VbsNxw0jtDcU/view?usp=sharing",
        "k": "https://drive.google.com/file/d/1H5F6ya8uiNO31OK0Sq26jaxe9ue2_bhG/view?usp=sharing",
        "l": "https://drive.google.com/file/d/1XXuEA3DKnReeYAEumQ58ci4DZVPCATsU/view?usp=sharing",
        "m": "https://drive.google.com/file/d/1XPpYf6i7otBdveyG0L5SYPiFQA8pgEfK/view?usp=sharing",
        "n": "https://drive.google.com/file/d/1LHWgjMJzjHMA-t82uoG4S4q7p9In7B80/view?usp=sharing",
        "o": "https://drive.google.com/file/d/1-8-Yu1q2Qy-lLPYVLh4kD_v4imAVBTJo/view?usp=sharing",
        "p": "https://drive.google.com/file/d/1XHn8yeyk1RLxx6y8Xoi16N24VvyyLTXs/view?usp=sharing",
        "q": "https://drive.google.com/file/d/14xgYsBQTvs_BK84NzBB_5K7qJYKmkulp/view?usp=sharing",
        "r": "https://drive.google.com/file/d/1WkGcW1RO2S-aZKokYCDwUtQLlnjpHZ54/view?usp=sharing",
        "s": "https://drive.google.com/file/d/14WWMAKRQkFKcDUiiGSkm5IcJknEE-Vhf/view?usp=sharing",
        "t": "https://drive.google.com/file/d/100Y-HCXKrXlPPG-ylyWPbhj8Rm3osgtQ/view?usp=sharing",
        "u": "https://drive.google.com/file/d/1OS4M1JJg1kYka_sTjogq2jP8nzIK6t8s/view?usp=sharing",
        "v": "https://drive.google.com/file/d/17d_l8GnwgOxl4hoMO--gmKhsI_lyIHRs/view?usp=sharing",
        "w": "https://drive.google.com/file/d/1Ibyefap54DwKSBufrAFqwyaARjJPRWME/view?usp=sharing",
        "x": "https://drive.google.com/file/d/1Uz5DUkiBlu30sVVBLbYxv5rNgHuz659s/view?usp=sharing",
        "y": "https://drive.google.com/file/d/1luefX4zCSjMcL_ioYBzs97GONaiJBRXP/view?usp=sharing",
        "z": "https://drive.google.com/file/d/1gD5DXA_rkZtDISgWe-hXvmotQmtUlsnC/view?usp=sharing"
    ]

    // Método para actualizar las imágenes según el texto introducido
    func updateImages(for text: String) {
        // Elimina todas las subviews previas
        imagesContainerView.subviews.forEach { $0.removeFromSuperview() }
        
        // Añade las nuevas imágenes
        var xOffset: CGFloat = 0
        let imageSize: CGFloat = 40 // Tamaño de cada imagen
        
        for character in text.lowercased() {
            if let urlString = letterToImageURL[character], let url = URL(string: urlString) {
                let imageView = UIImageView(frame: CGRect(x: xOffset, y: 0, width: imageSize, height: imageSize))
                imagesContainerView.addSubview(imageView)
                
                // Cargar la imagen desde el URL
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }
                }
                
                xOffset += imageSize + 5 // Espacio entre imágenes
            }
        }
        
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
