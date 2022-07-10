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
//        print("\n\n\n\n")
//        let tournamentsCount: Int?
        do {
            let tournamentsCount = try coreDataHandler.managedContext.count(for: Tournament.fetchRequest())
            if tournamentsCount > 0 {
                if let fetchedTournaments = coreDataHandler.fetchObjects(fetchRequest: Tournament.fetchRequest()) {
                    self.tournaments = fetchedTournaments
                }
            } else {
                requestTournaments()
                print("\n\nAAAAAAA\n\n")
            }
        } catch {
            print("error fetching data: \(error)")
        }
//        print("fetch tournaments")
        print(self.tournaments)
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
//        tournaments.append(firstTournament)
        coreDataHandler.save()
        
        
        
        
//        tournaments.append(Tournament(city: "Tunis", country: "Tunisia", start_date: "2020-10-08", end_date: "2020-10-15"))
//        tournaments.append(Tournament(city: "Madrid", country: "Spain", start_date: "2020-12-01", end_date: "2020-12-08"))
    }
    
    func requestTournaments() {
        let url = atpTournamentsURL
        apiHandler.requestData(url) { (result) in
            switch(result) {
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        print("\n\n\n\nTTTTTTT\n\n\n\n")
                        print(json)
                    }
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
            print(result)
        }
    }
}

