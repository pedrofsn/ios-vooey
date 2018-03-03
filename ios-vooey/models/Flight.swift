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
    
    private let mock = MockedData()
    
    func getDestination() -> String {
        return from.shortname + " -> " + to.shortname
    }
    
    func isBoarding(nowInMillis : Double) -> Bool {
        return nowInMillis < (startInMillis - mock.windowToLandingAndBoarding)
    }
    
    func isLanding(nowInMillis : Double) -> Bool {
        return nowInMillis > (endInMillis + mock.windowToLandingAndBoarding)
    }
}
