//
//  CreatingTableViewCell.swift
//  Journal
//
//  Created by Francis Tseng on 2017/8/4.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

import UIKit

class CreatingTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!

    @IBOutlet weak var eventTitle: UILabel!

    @IBOutlet weak var background: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bind()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bind() {
        
        background.layer.shadowOpacity = 1
        background.layer.shadowColor = UIColor(red: 160/255.0, green: 168/255.0, blue: 165/255.0, alpha: 1).cgColor
        background.layer.shadowRadius = 15
        background.layer.shadowOffset = CGSize(width: 0, height: 5)
        eventImageView.layer.cornerRadius = 8

    }

}
