//
//  TournamentsTableViewCell.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import UIKit

class TournamentsTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    let dateFormatter = MyDateFormatter()
    
    static let identifier = "TournamentsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TournamentsTableViewCell", bundle: nil)
    }
    
    func populateCell(with tournament: Tournament) {
        
        cityLabel.text = tournament.city
        countryLabel.text = tournament.country
//        startDateLabel.text = dateFormatter.formatter.string(from: tournament.start_date)
//        endDateLabel.text = dateFormatter.formatter.string(from: tournament.end_date)
        startDateLabel.text = tournament.start_date
        endDateLabel.text = tournament.end_date
    }
    
}
