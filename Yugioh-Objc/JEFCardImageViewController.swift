//
//  JEFCardImageViewController.swift
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

class JEFCardImageViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    var card: JEFCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        guard let card = card else {return }
        JEFDeck.fetchImage(card) { (image) in
            DispatchQueue.main.async {
                self.cardImage.image = image
            }
        }
    }
}
