//
//  StudentController.swift
//  StudentsList(practice)
//
//  Created by Dongwoo Pae on 5/26/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class StudentController {
    //creating a file (location since we have json file to use this data for
    
    private var persistentFileURL: URL? {
        guard let filePath = Bundle.main.path(forResource: "students", ofType: "json") else {return nil}
        return URL(fileURLWithPath: filePath)
        
    }
    //decoding this json file into Student object so it can be used to show UI and others
    func loadFromPersistentStore(completion: @escaping ([Student]?, Error?) -> Void) {
        let bgQueue = DispatchQueue(label: "studentQueue", attributes: .concurrent)  //concurrent queue
        bgQueue.async {
            let fm = FileManager.default
            guard let url = self.persistentFileURL,
                fm.fileExists(atPath: url.path) else {return}
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let students = try decoder.decode([Student].self, from: data)
                completion(students, nil)
            } catch {
                print("error : \(error) happened")
                completion(nil, error)
            }
        }
    }
}
