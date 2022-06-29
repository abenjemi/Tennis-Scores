//
//  ATPViewController.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/27/22.
//

import UIKit

class ATPViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func playersButtonTapped(_ sender: UIButton) {
        print("players button tapped")
    }
    
    
    @IBAction func rankingButtonTapped(_ sender: UIButton) {
        print("ranking button tapped")
    }
    
    @IBAction func tournamentsButtonTapped(_ sender: UIButton) {
        print("tournaments button tapped")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TournamentsViewController") as? TournamentsViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
