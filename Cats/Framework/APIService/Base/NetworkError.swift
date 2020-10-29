//
//  NetworkError.swift
//  Cats
//
//  Created by Andres Carrillo on 26/10/20.
//

import Foundation

enum NetworkError: String, Error {
    case parsingData = "Failed to fetch the data :("
    case responseUnsuccessfull = "Something went wrong with the server.  Try later."
    case genericError = "Ups.  Something went wrong:(.  Try later."
}
