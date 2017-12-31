//
//  APIManager.swift
//  GitHubUsers
//
//  Created by Phu Quang Nguyen on 12/31/17.
//  Copyright © 2017 Phu Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    static func getGitHubUsers(completion: @escaping (_ error: Error?, _ users: [GitHubUser]) -> Void) {
        Alamofire.request("https://api.github.com/users").validate().responseJSON { response in
            switch response.result {
            case .success:
                if let arrayOfDic = response.result.value as? [Dictionary<String,AnyObject>] {
                    
                    var users = [GitHubUser]();
                    
                    for aDic in arrayOfDic{
                        var userName: String = ""
                        var userLocation: String = ""
                        var userAvatarURL: URL?
                        
                        if let name = aDic["name"] as? String{
                            userName = name
                        }
                        
                        if let location = aDic["location"] as? String{
                            userLocation = location
                        }
                        
                        if let avatarURLString = aDic["avatar_url"] as? String{
                            userAvatarURL = URL(string: avatarURLString)
                        }
                        
                        let user = GitHubUser(name: userName, location: userLocation, avatarURL: userAvatarURL)
                        users.append(user)
                    }
                    
                    completion(nil, users)
                }
            case .failure(let error):
                print(error)
                completion(error, [])
            }
        }
    }
    
}
