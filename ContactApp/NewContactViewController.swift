//
//  NewContactViewController.swift
//  ContactApp
//
//  Created by Рома on 19.05.2020.
//  Copyright © 2020 SashaShch. All rights reserved.
//
import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func newContactViewControllerDidGetContactInfo(name: String, lastName: String, phone: String)
}

class NewContactViewController: UIViewController {
    
    weak var delegate: NewContactViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        delegate?.newContactViewControllerDidGetContactInfo(name: nameTextField.text ?? "", lastName: lastNameTextField.text ?? "", phone: phoneTextField.text ?? "")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
