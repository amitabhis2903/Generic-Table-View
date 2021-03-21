//
//  CustomTableViewCell.swift
//  GenericTableView
//
//  Created by macbook05 on 12/03/21.
//  Copyright © 2021 macbook05. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setImage() -> UIImage? {
        let image = UIImage(systemName: "square.and.arrow.up.fill")
        return image
    }
    
}
