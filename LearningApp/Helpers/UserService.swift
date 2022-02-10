//
//  UserService.swift
//  LearningApp
//
//  Created by Mason Garrett on 2022-02-10.
//

import Foundation

class UserService {
    
    var user = User()
    static var shared = UserService()
    
    private init() {
        
    }
}
