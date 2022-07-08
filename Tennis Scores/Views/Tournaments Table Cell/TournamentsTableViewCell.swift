//
//  TournamentsTableViewCell.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import UIKit
import CoreData

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
    
    func populateCell(with tournament: NSManagedObject) {
        
        cityLabel.text = tournament.value(forKey: "city") as? String
        countryLabel.text = tournament.value(forKey: "country") as? String
//        startDateLabel.text = dateFormatter.formatter.string(from: tournament.start_date)
//        endDateLabel.text = dateFormatter.formatter.string(from: tournament.end_date)
        startDateLabel.text = tournament.value(forKey: "start_date") as? String
        endDateLabel.text = tournament.value(forKey: "end_date") as? String
    }
    
}
