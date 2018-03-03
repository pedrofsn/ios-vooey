//
//  ViewControllerFlights.swift
//  ios-vooey
//
//  Created by Aluno on 03/03/2018.
//  Copyright © 2018 Instituto de Informática. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerFlights: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let idAirport : Double = 0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
/*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // menu.count
    }
*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockedData.getInstance().getFlightsTo(idAirport : idAirport).count
    }
    
/*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Brasília" // menu[section]
    }
 */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let adapterFlight = tableView.dequeueReusableCell(withIdentifier: "adapterFlight") as! TableViewCellAdapterFlight
        let flights = MockedData.getInstance().getFlightsTo(idAirport : idAirport)
        let flight = flights[indexPath.row]
        
        print("Total: " + String(flights.count))
        print(String(flight.idFlight))
        
        // let obj = itens[indexPath.section][indexPath.row]
        // customCell.imageView?.image = UIImage(named : obj)
        
        adapterFlight.labelDestination.text = flight.getDestination();
        adapterFlight.labelTime.text = "De \(flight.startInMillis) até \(flight.endInMillis)";
        
        return adapterFlight
    }

}
