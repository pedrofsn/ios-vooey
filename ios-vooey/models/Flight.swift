//
//  Flight.swift
//  ios-vooey
//
//  Created by Aluno on 03/03/2018.
//  Copyright © 2018 Instituto de Informática. All rights reserved.
//

import Foundation

struct Flight {
    let idFlight : Double
    
    let startInMillis : Double
    let endInMillis : Double
    
    let from : Airport
    let to : Airport
    
    func getDestination() -> String {
        return from.shortname + " -> " + to.shortname
    }
    
    func isBoarding(nowInMillis : Double) -> Bool {
        let windowToBoarding = (1000 * 60 * 2) as Double
        return nowInMillis < (startInMillis - windowToBoarding)
    }
    
    func isLanding(nowInMillis : Double) -> Bool {
        let windowToLanding = (1000 * 60 * 2) as Double
        return nowInMillis > (endInMillis + windowToLanding)
    }
}
