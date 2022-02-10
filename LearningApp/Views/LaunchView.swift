//
//  LaunchView.swift
//  LearningApp
//
//  Created by Mason Garrett on 2022-02-10.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.loggedIn == false {
            
            // Show login view
            LoginView()
                .onAppear {
                    // Check if user is logged in or out
                    model.checkLogin()
                }
        } else {
            
            // Show logged in view
            TabView {
                
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "book")
                            Text("Learn")
                        }
                    }
                
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
            }
            .onAppear {
                self.model.getDatabaseData()
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
