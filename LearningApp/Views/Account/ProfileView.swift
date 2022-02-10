//
//  ProfileView.swift
//  LearningApp
//
//  Created by Mason Garrett on 2022-02-10.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        Button {
            
            // Sign out the user
            try! Auth.auth().signOut()
            
            // Change to logged out view
            self.model.checkLogin()
            
        } label: {
            Text("Sign out")
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
