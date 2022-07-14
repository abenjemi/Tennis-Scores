//
//  ViewController.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import UIKit
import CoreData

class TournamentsViewController: UIViewController {
    
//    let isATP: Bool
    
    let coreDataHandler = CoreDataHandler.shared
    let apiHandler = APIHandler.shared
    let atpTournamentsURL = "https://tennis-live-data.p.rapidapi.com/tournaments/ATP/2020"
    
    @IBOutlet weak var tournamentsTable: UITableView!
    var tournaments = [Tournament]() {
        didSet {
            self.tournamentsTable.reloadData()
        }
    }
    let dateFormatter = MyDateFormatter()
    
//    init(tournaments: [Tournament]) {
//        self.tournaments = tournaments
//        super.init(nibName: "TournamentsViewController", bundle: nil)
//    }
//
//    required convenience init?(coder: NSCoder) {
//        self.init(tournaments: [Tournament]())
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tournaments"
        fetchTournaments()
        setupTournamentsTable()
    }
    
    func fetchTournaments() {
        // try to fetch data from database, if it's not there get it from the api
        do {
            let tournamentsCount = try coreDataHandler.managedContext.count(for: Tournament.fetchRequest())
            if tournamentsCount > 0 {
                if let fetchedTournaments = coreDataHandler.fetchObjects(fetchRequest: Tournament.fetchRequest()) {
                    self.tournaments = fetchedTournaments
                }
            } else {
                requestTournaments()
            }
        } catch {
            print("error fetching data: \(error)")
        }
    }
    
    func setupTournamentsTable() {
        
        tournamentsTable.register(TournamentsTableViewCell.nib(), forCellReuseIdentifier: TournamentsTableViewCell.identifier)
        
        tournamentsTable.delegate = self
        tournamentsTable.dataSource = self
    }
    
    func createData() {
        
        guard let firstTournament = coreDataHandler.createObject(entityName: "Tournament") else { return }
        firstTournament.setValue("Tunisia", forKey: "country")
        firstTournament.setValue("Tunis", forKey: "city")
        guard let secondTournament = coreDataHandler.createObject(entityName: "Tournament") else { return }
        secondTournament.setValue("USA", forKey: "country")
        secondTournament.setValue("La Jolla", forKey: "city")
        coreDataHandler.save()
    }
    
    func requestTournaments() {
        let url = atpTournamentsURL
        apiHandler.requestData(url) { (result) in
            switch(result) {
            case .success(let data):
                print(data)
                do {
                    guard
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let results = json["results"] as? [[String: Any]]
                        else { return }
                    let tournaments: [Tournament]? = results.compactMap { result in
                        guard
                            // storing tournament attributes
                            let city = result["city"] as? String,
                            let code = result["city"] as? String,
                            let country = result["country"] as? String,
                            let country_code = result["country_code"] as? String,
                            let end_date = result["end_date"] as? String,
                            let id = result["id"] as? Int,
                            let name = result["name"] as? String,
                            let season = result["season"] as? Int,
                            let start_date = result["start_date"] as? String,
                            let surface = result["surface"] as? String
                        else { return nil }
                        
                        // creating a tournament
                        let tournament = Tournament(context: self.coreDataHandler.managedContext)
                        tournament.city = city
                        tournament.code = code
                        tournament.country = country
                        tournament.country_code = country_code
                        tournament.end_date = end_date
                        tournament.id = Int64(id)
                        tournament.name = name
                        tournament.season = Int64(season)
                        tournament.start_date = start_date
                        tournament.surface = surface
                        
                        return tournament
                    }
                    self.coreDataHandler.save()
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}




