//  Created by Abdykadyr Maksat on 9/20/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.
import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var alrnName: UILabel!
    @IBOutlet weak var alarmPhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
