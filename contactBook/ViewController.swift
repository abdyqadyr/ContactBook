//
//  ViewController.swift
//  contactBook
//
//  Created by Abdykadyr Maksat on 9/20/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var contacts:[Alarm] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        let contact = contacts[indexPath.row]
        cell?.alrnName.text = contact.name_surname
        cell?.alarmPhone.text = contact.phone_num
        cell?.contactImageView.image = contact.image
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         myTableView.deselectRow(at: indexPath , animated: true)
    }
    

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let index = (myTableView.indexPathForSelectedRow?.row)!
//            let destination = segue.destination as! DetailViewController
            let contact = contacts[index]
//            destination.contact = contact
            
            let navviewController = segue.destination as? UINavigationController
            let viewController = navviewController?.topViewController as? DetailViewController
            viewController?.indexPath = myTableView.indexPathForSelectedRow
            viewController?.contact = contact
//            destination.name_surname = contacts[index].name_surname
//            destination.phone_num = contacts[index].phone_num
//            destination.image = contacts[index].image
            
            
            
        }
        
        

    }
    @IBAction func unwindToContactList(segue:UIStoryboardSegue){
        if let viewController = segue.source as? AddContactViewController{
            let name = viewController.nameTextField.text
            let phone = viewController.phoneTextField.text

            
            let gender = viewController.gender
            let alarm = alarms.init(name,phone,UIImage.init(named: gender!)!)
            alarm.append(contacts)
            myTableView.reloadData()
        }else if let viewController = segue.source as? DetailViewController{
            if viewController.isDeleted! {
                let indPath = viewController.indexPath
                contacts.remove(at: (indPath?.row)!)
                myTableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath:IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            contacts.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}

