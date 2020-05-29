//
//  ViewController.swift
//  ContactApp
//
//  Created by Рома on 19.05.2020.
//  Copyright © 2020 SashaShch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contacts = [("Иван","Синичкин" ,"1111111"),
                    ("Петр", "Кошечкин", "2222222"),
                    ("Кирилл" ,"Баранов", "3333333")]
    
    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = contacts.sorted{ $0.0 < $1.0 }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "New Contact Controller") {
            if let newContactViewController = vc as? NewContactViewController {
                newContactViewController.delegate = self
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellView
        cell = tableView.dequeueReusableCell(withIdentifier: "Contact Cell", for: indexPath) as! CellView
        cell.nameLabel.text = contacts[indexPath.row].0
        cell.lastNameLabel.text = contacts[indexPath.row].2
        cell.phoneLabel.text = contacts[indexPath.row].1
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(identifier: "Additional Info"){
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension ViewController: NewContactViewControllerDelegate {
    func newContactViewControllerDidGetContactInfo(name: String, lastName: String, phone: String) {
        contacts.append((name, lastName, phone))
        contacts = contacts.sorted{ $0.0 < $1.0 }
        contactTableView.reloadData()
    }
    
    
}
