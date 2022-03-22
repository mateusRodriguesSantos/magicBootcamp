//
//  ViewController.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 15/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MagicTGatheringAPIResponse().getCards(from: "SOI", completion: { (cards) in
            print(cards.map { $0.id })
        })
    }
}

