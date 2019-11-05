//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Huong Do on 10/27/19.
//  Copyright © 2019 VinID. All rights reserved.
//

import UIKit
import VinIDPaySDK

class ViewController: UIViewController {
    
    @IBOutlet weak var orderTextField: UITextField!
    @IBOutlet weak var signatureTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkAppInstall(_ sender: Any) {
        let hasInstalled = VinIDPay.sharedInstance.hasVinIDAppInstalled
        let message = hasInstalled ? "App installed, ready to pay" : "App not installed"
        
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func proceedPayment(_ sender: Any) {
        view.endEditing(true)
        guard let id = orderTextField.text,
            let signature = signatureTextField.text else { return }
        
        VinIDPay.sharedInstance.pay(withOrderId: id, signature: signature) { [weak self] (id, status) in
            var message = ""
            
            switch status {
            case .success:
                message = "payment successful!"
            case .aborted:
                message = "user aborted payment"
            case .failure:
                message = "payment failed"
            }
            
            let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            self?.present(controller, animated: true, completion: nil)
        }
    }
    
}

