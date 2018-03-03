//
//  Airport.swift
//  ios-vooey
//
//  Created by Aluno on 03/03/2018.
//  Copyright © 2018 Instituto de Informática. All rights reserved.
//

import Foundation

struct Airport {
    let idAirport : Double
    
    let name : String
    let location : Location
    
    let flights : Array<Flight>
}
