//
//  Follow-ViewModel.swift
//  Follow.App
//
//  Created by Gabriel Gonzaga  on 22/09/24.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    
    @Published var isFollowing = false
    @Published var userFollowers = String()
    
    var user = User(picture: "profile",
                    name: "Gabriel Gonzaga",
                    nickName: "@gaablife",
                    followers: 1345)
    init(){
        loadFollowers()
    }
    
    func loadFollowers(){
        self.userFollowers = custumizeNumber(value: user.followers)
    }
    
    func custumizeNumber(value: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)"
    }
    
    func followToogle(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
