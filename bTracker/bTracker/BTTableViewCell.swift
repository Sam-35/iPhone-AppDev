//
//  BTTableViewCell.swift
//  bTracker
//
//  Created by Sam on 6/20/19.
//  Copyright © 2019 sam. All rights reserved.
//

import UIKit

class BTTableViewCell: UITableViewCell {

    @IBOutlet weak var label_RSSI: UILabel!
    @IBOutlet weak var label_deviceName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
