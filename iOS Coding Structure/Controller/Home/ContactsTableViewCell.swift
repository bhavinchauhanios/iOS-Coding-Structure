//
//  ContactsTableViewCell.swift
//  iOS Coding Structure
//
//  Created by WOS on 10/02/18.
//  Copyright © 2018 WOS. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

  
  @IBOutlet weak var imgProfilePic: UIImageView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblContactNo: UILabel!
  @IBOutlet weak var imgLineShare: UIImageView!
  @IBOutlet weak var lblProfileName: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
