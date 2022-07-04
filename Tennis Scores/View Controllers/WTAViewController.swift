//
//  WTAViewController.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 7/3/22.
//

import UIKit

class WTAViewController: UIViewController {
    
    @IBAction func WTAPlayersButtonTapped(_ sender: UIButton) {
        print("wta players button tapped")
    }
    
    @IBAction func WTARankingButtonTapped(_ sender: UIButton) {
        print("wta ranking button tapped")
    }
    
    
    @IBAction func WTATournamentsButtonTapped(_ sender: UIButton) {
        print("wta tournaments button tapped")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TournamentsViewController") as? TournamentsViewController else {
            return
        }
        vc.model = [Tournament(city: "La Jolla", country: "US", start_date: "2/2/20", end_date: "2/10/20")]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wta view controller has loaded")
    }

}
