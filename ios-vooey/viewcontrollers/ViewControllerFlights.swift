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
        return getFlights().count
    }
    
/*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Brasília" // menu[section]
    }
 */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let adapterFlight = tableView.dequeueReusableCell(withIdentifier: "adapterFlight") as! TableViewCellAdapterFlight
        let flight = getFlights()[indexPath.row]
        
        adapterFlight.labelDestination.text = flight.getDestination();
        adapterFlight.labelTime.text = "De \(flight.startInMillis) até \(flight.endInMillis)";
        
        return adapterFlight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedFlight = getFlights()[indexPath.row]
        print("Clicked on \(touchedFlight.getDestination())")
    }
    
    private func getFlights() -> Array<Flight> {
        return MockedData.getInstance().getFlightsTo(idAirport : idAirport)
    }

}
