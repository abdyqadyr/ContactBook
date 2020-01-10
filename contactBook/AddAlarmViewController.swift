//  Created by Abdykadyr Maksat on 9/20/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var gender:String!
    @IBAction func saveAndClose(_ sender: Any) {
        performSegue(withIdentifier: "unwindToAlarmList", sender: self)
    }
    @IBOutlet weak var picker: UIPickerView!
    let pickerData=["10:15AM","10:20AM","10:30AM","10:40AM", "10:15AM","11:20AM", "12:30PM","12:40PM", "10 15PM","10 20PM", ]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        self.gender = pickerData[picker.selectedRow(inComponent: 0)]
        
        navigationItem.title = "New Alarm"

        // Do any additional setup after loading the view.
    }
    
}
extension AddContactViewController :UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}
