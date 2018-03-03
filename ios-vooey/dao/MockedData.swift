//
//  MockedData.swift
//  ios-vooey
//
//  Created by Aluno on 03/03/2018.
//  Copyright © 2018 Instituto de Informática. All rights reserved.
//

import Foundation

class MockedData {
    
    let windowToLandingAndBoarding : Double
    let locationGoiania : Location
    let locationBrasilia : Location
    let companyGol : Company
    let companyAzul : Company
    let airplane1 : Airplane
    let airplane2 : Airplane
    let airport1 : Airport
    let airport2 : Airport
    var flights = Array<Flight>()
    
    init() {
        windowToLandingAndBoarding = (1000 * 60 * 1) as Double // One hour in millis
     
        locationGoiania = Location(
            idLocation : 0,
            latitude : -16.632550,
            longitude : -49.222632,
            city : "Goiânia",
            uf : "GO"
        )
        
        locationBrasilia = Location(
            idLocation : 1,
            latitude : -15.870120,
            longitude : -47.918989,
            city : "Brasília",
            uf : "DF"
        )
        
        companyGol = Company(
            idCompany : 0,
            name : "GOL"
        )
        
        companyAzul = Company(
            idCompany : 1,
            name : "Azul"
        )
        
        airplane1 = Airplane(
            idAirplane : 0,
            code : "A000",
            model : "Jumbo",
            company : companyAzul
        )
        
        airplane2 = Airplane(
            idAirplane : 0,
            code : "G001",
            model : "Jumbo",
            company : companyGol
        )
        
        airport1 = Airport(
            idAirport : 0,
            name : "Aeroporto Santa Genoveva",
            location : locationGoiania
        )
        
        airport2 = Airport(
            idAirport : 1,
            name : "Aeroporto Internacional de Brasília",
            location : locationBrasilia
        )
        
        var lastStartInMillis : Double = 0
        for i in 0...30 {
            let pair = arc4random() % 2 == 0
            
            if(lastStartInMillis == 0) {
                lastStartInMillis = 1520101503162
            }
            
            let flightRandom = Flight(
                idFlight : Double(i),
                startInMillis : lastStartInMillis, //https://currentmillis.com
                endInMillis : (lastStartInMillis + windowToLandingAndBoarding),
                from : pair ? airport1 : airport2,
                to : pair == false ? airport2 : airport1
            )
            
            lastStartInMillis = flightRandom.endInMillis + windowToLandingAndBoarding
            flights.append(flightRandom)
        }
    }
    
    func getFlightsFrom(idAirport : Double) -> Array<Flight> {
        return flights.filter { obj in obj.from.idAirport == idAirport }
    }
    
    func getFlightsTo(idAirport : Double) -> Array<Flight> {
        return flights.filter { obj in obj.to.idAirport == idAirport }
    }
    
}
