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
    
    let coreDataHandler = CoreDataHandler()
    
    @IBOutlet weak var tournamentsTable: UITableView!
    var tournaments: [NSManagedObject] = []
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
//        fetchTournaments()
        createData()
//        requestTournaments()
//        setupTournamentsTable()
        
    }
    
    func fetchTournaments() {
        // try to fetch data from database, if it's not there get it from the api
        print("fetch tournaments")
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
//        tournaments.append(firstTournament)
        coreDataHandler.save()
        
        
        
        
//        tournaments.append(Tournament(city: "Tunis", country: "Tunisia", start_date: "2020-10-08", end_date: "2020-10-15"))
//        tournaments.append(Tournament(city: "Madrid", country: "Spain", start_date: "2020-12-01", end_date: "2020-12-08"))
    }
    
//    func requestTournaments() {
//        let headers = [
//            "X-RapidAPI-Key": "c38f15efa6mshac563c3f3e7c18bp1edf1ajsnc57dec6ddb1c",
//            "X-RapidAPI-Host": "tennis-live-data.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://tennis-live-data.p.rapidapi.com/tournaments/ATP/2020")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            guard let data = data, error == nil else {
//                print("\nSomething is wrong\n")
//                return
//            }
//
//            var json: Tournaments?
//            do {
//                json = try JSONDecoder().decode(Tournaments.self, from: data)
//            } catch {
//                print("error: \(error)")
//                return
//            }
//
//            guard let result = json else { return }
//            self.tournaments.append(contentsOf: result.results)
//            DispatchQueue.main.async {
//                self.tournamentsTable.reloadData()
//            }
//
//        })
//        dataTask.resume()
//    }


}

