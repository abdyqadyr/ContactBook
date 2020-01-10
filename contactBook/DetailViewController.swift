//  Created by Abdykadyr Maksat on 9/20/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.
import UIKit

class DetailViewController: UIViewController {
//    var name_surname:String?
//    var phone_num:String?
//    var image:UIImage?
    var contact:Alarm?=nil
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var nameSurname: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    var isDeleted:Bool? = false
    var indexPath:IndexPath? = nil
    @IBAction func deleteAlarm(_ sender: UIButton) {
        isDeleted=true
        performSegue(withIdentifier: "unwindToAlarmList", sender: self)
    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwindToAlarmList", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            nameSurname.text = contact?.name_surname
            phoneNum.text = contact?.phone_num
            contactImage.image = contact?.image
            navigationItem.title = "Alarm"
        navigationItem.backBarButtonItem?.title = "Alarm"

        // Do any additional setup after loading the view.
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
