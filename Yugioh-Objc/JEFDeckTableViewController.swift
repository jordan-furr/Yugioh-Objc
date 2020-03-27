//
//  JEFDeckTableViewController.swift
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

class JEFDeckTableViewController: UITableViewController {

    @IBOutlet weak var cardSearch: UISearchBar!
    var cards: [JEFCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardSearch.delegate = self
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        
        let card = cards[indexPath.row]
        cell.textLabel?.text = card.name
        cell.detailTextLabel?.text = card.type
        
        if (indexPath.row % 2 == 0){
            cell.backgroundColor = .yellow
        }
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchterm = searchBar.text else {return}
        JEFDeck.fetchCards(searchterm) { (cards) in
            DispatchQueue.main.async {
                self.cards = cards
                self.tableView.reloadData()
            }
        }
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "toImage"{
           if let destinationVC = segue.destination as? JEFCardImageViewController {
               if let index = tableView.indexPathForSelectedRow {
                   let card = cards[index.row]
                   destinationVC.card = card
               }
           }
       }
   }


}

extension JEFDeckTableViewController: UISearchBarDelegate {}
