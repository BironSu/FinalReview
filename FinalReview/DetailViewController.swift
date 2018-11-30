//
//  DetailViewController.swift
//  FinalReview
//
//  Created by Biron Su on 11/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var picture: InstaPost?
    var text = ""
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var pictureTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        pictureImage.image = picture?.image
        picture?.comments.forEach{text += "\($0)\n"}
        pictureTextView.text = text
    }
}
