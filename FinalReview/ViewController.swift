//
//  ViewController.swift
//  FinalReview
//
//  Created by C4Q on 11/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allPost = InstaPost.allPosts
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController, let selectedCell = myTableView.indexPathForSelectedRow else {return}
        destination.picture = allPost[selectedCell.row]
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPost.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageCell else {return UITableViewCell()}
        if indexPath.row == 2 {
            guard let bannerCell = myTableView.dequeueReusableCell(withIdentifier: "adCell", for: indexPath) as? AdCell else {return UITableViewCell()}
            bannerCell.textLabel?.text = "Win 💰💰"
            return bannerCell
        } else if indexPath.row < 2 {
            cell.pictureImage.image = allPost[indexPath.row].image
            cell.pictureLabel.text = allPost[indexPath.row].caption
        } else {
            cell.pictureImage.image = allPost[indexPath.row - 1].image
            cell.pictureLabel.text = allPost[indexPath.row - 1].caption
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let VC = storyboard.instantiateViewController(withIdentifier: "adVC") as? AdvertViewController else {return}
        VC.modalPresentationStyle = .overCurrentContext
        present(VC, animated: true, completion: nil)
        }
    }
}
