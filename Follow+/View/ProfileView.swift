//
//  ProfileView.swift
//  Follow.App
//
//  Created by Gabriel Gonzaga  on 22/09/24.
//

import SwiftUI

struct ProfileView: View{
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View{
        VStack{
            ProfileDataView()
            ActionView()
            }
        .animation(.easeInOut, value: viewModel.isFollowing)
        .environmentObject(viewModel)
        }
    }

struct ProfileDataView: View{
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View{
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 200, height: 200)
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 30, weight: .bold))
            .padding(.bottom,1)
        
        Text(viewModel.user.nickName)
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 60, weight: .ultraLight))
            //.padding(20)
            .padding(viewModel.isFollowing ? 40 : 25 )
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View{
        VStack{
            Button(action: {viewModel.followToogle()}, label: {
                Text(!viewModel.isFollowing ? "Follow" : "Unfollow")
                    .font(.title3)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ?.blue : .black)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Enviar mensagem")
                    .font(.title3)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        } .padding(30)
    }
}


#Preview{
    ProfileView()
}
