//
//  UsersPresentor.swift
//  GitHubUsers
//
//  Created by Phu Quang Nguyen on 12/31/17.
//  Copyright © 2017 Phu Nguyen. All rights reserved.
//

import UIKit

protocol UsersDisplayView {

    func displayUsers(users: [String])
    func displayError(error: Error)
    
    
}

class UsersPresentor: NSObject {

    private var view: UsersDisplayView
    
    init(displayView: UsersDisplayView) {
        self.view = displayView;
    }
    
    func getUsers() {
        APIManager.getGitHubUsers { (error: Error?, users: [GitHubUser]) in
            if error != nil {
                self.view.displayError(error: error!)
            } else {
                self.view.displayUsers(users: users.map({ user -> String in
                    return user.name
                }))
            }
        }
    }
    
}
