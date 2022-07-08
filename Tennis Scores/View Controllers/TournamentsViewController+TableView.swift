//
//  tournamentsTableExtensions.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import UIKit
import CoreData

extension TournamentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TournamentsTableViewCell.identifier) as? TournamentsTableViewCell else { return UITableViewCell() }
        cell.populateCell(with: tournaments[indexPath.row])
        return cell
    }
}
