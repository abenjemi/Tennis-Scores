//
//  ViewController.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import UIKit

class TournamentsViewController: UIViewController {
    
    @IBOutlet weak var tournamentsTable: UITableView!
    var model = [Tournament]()
    let dateFormatter = MyDateFormatter()
    
//    init(model: [Tournament]) {
//        self.model = model
//        super.init(nibName: "TournamentsViewController", bundle: nil)
//    }
//
//    required convenience init?(coder: NSCoder) {
//        self.init(model: [Tournament]())
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tournaments"
//        createData()
//        requestTournaments()
        setupTournamentsTable()
        
    }
    
    func setupTournamentsTable() {
        
        tournamentsTable.register(TournamentsTableViewCell.nib(), forCellReuseIdentifier: TournamentsTableViewCell.identifier)
        
        tournamentsTable.delegate = self
        tournamentsTable.dataSource = self
    }
    
    func createData() {
        
        let startDate1 = dateFormatter.formatter.date(from: "2020-10-08")
        let endDate1 = dateFormatter.formatter.date(from: "2020-10-15")
        let startDate2 = dateFormatter.formatter.date(from: "2020-12-01")
        let endDate2 = dateFormatter.formatter.date(from: "2020-12-08")
        model.append(Tournament(city: "Tunis", country: "Tunisia", start_date: "2020-10-08", end_date: "2020-10-15"))
        model.append(Tournament(city: "Madrid", country: "Spain", start_date: "2020-12-01", end_date: "2020-12-08"))
    }
    
    func requestTournaments() {
        let headers = [
            "X-RapidAPI-Key": "c38f15efa6mshac563c3f3e7c18bp1edf1ajsnc57dec6ddb1c",
            "X-RapidAPI-Host": "tennis-live-data.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tennis-live-data.p.rapidapi.com/tournaments/ATP/2020")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("\nSomething is wrong\n")
                return
            }

            var json: Tournaments?
            do {
                json = try JSONDecoder().decode(Tournaments.self, from: data)
            } catch {
                print("error: \(error)")
                return
            }
            
            guard let result = json else { return }
            self.model.append(contentsOf: result.results)
            DispatchQueue.main.async {
                self.tournamentsTable.reloadData()
            }
            
        })
        dataTask.resume()
    }


}

