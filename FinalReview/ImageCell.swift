//
//  ImageCell.swift
//  FinalReview
//
//  Created by Biron Su on 11/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var pictureLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
