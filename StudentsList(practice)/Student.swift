//
//  Student.swift
//  StudentsList(practice)
//
//  Created by Dongwoo Pae on 5/26/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    var course: String
    
    //this will bring first name of full name
    var firstName: String {
        return String(name.split(separator: " ")[0])
    }
    
    //this will bring last name of full name
    var lastName: String {
        return String(name.split(separator: " ")[1])
    }
}
