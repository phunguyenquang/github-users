//
//  UsersViewController.swift
//  GitHubUsers
//
//  Created by Phu Quang Nguyen on 12/31/17.
//  Copyright © 2017 Phu Nguyen. All rights reserved.
//

import UIKit
import TagListView
//import UsersPresenter

class UsersViewController: UIViewController {

    @IBOutlet weak var tagListView: TagListView!
    
    private var usersPresenter: UsersPresentor!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        usersPresenter = UsersPresentor(displayView: self)
        usersPresenter.getUsers()
        tagListView.delegate = self
    }

}

extension UsersViewController: TagListViewDelegate {
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tap on title \(title)")
        performSegue(withIdentifier: "UserListToUserDetails", sender: nil)
    }
    
}

extension UsersViewController: UsersDisplayView {
    func displayUsers(users: [String]) {
        tagListView.addTags(users);
    }
    
    func displayError(error: Error) {
        
    }
}
