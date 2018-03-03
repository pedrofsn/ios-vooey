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
        return from.name + " -> " + to.name
    }
    
    func isBoarding(nowInMillis : Double) -> Bool {
        return nowInMillis < (startInMillis - MockedData.getInstance().windowToLandingAndBoarding)
    }
    
    func isLanding(nowInMillis : Double) -> Bool {
        return nowInMillis > (endInMillis + MockedData.getInstance().windowToLandingAndBoarding)
    }
}
