//
//  AdvertViewController.swift
//  FinalReview
//
//  Created by Biron Su on 11/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AdvertViewController: UIViewController {
    var ads = Ad.allAds {
        didSet {
            adTableView.reloadData()
        }
    }
    
    @IBOutlet weak var adTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dismiss: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        adTableView.dataSource = self
        searchBar.delegate = self
        dismiss.isEnabled = true
    }
}
extension AdvertViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = adTableView.dequeueReusableCell(withIdentifier: "moneyList", for: indexPath) as? AdvertCell else {return UITableViewCell()}
        cell.textLabel?.text = ads[indexPath.row].prize
        return cell
    }
    @IBAction func dismiss (_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
}
extension AdvertViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" || searchBar.text == " " {
            ads = Ad.allAds
            return
        }
        if let string: String = searchBar.text {
            ads = ads.filter(){$0.prize.contains(string)}
        }
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}
