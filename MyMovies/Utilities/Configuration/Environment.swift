//
//  Environment.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
struct Environment {
    var name: String = ""
    var apiEndPoint: String = ""
}

//Production server configuration
let prodEnvironment = Environment(name: "production",
                                  apiEndPoint: "https://api.androidhive.info/json")
