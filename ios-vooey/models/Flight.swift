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
    let endInMillis : String
    
    let from : Location
    let to : Location
    let airplane : Airplane
}
