//
//  ContentView.swift
//  LearningApp
//
//  Created by Mason Garrett on 2022-01-25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm current lesson is set
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(destination: ContentDetailView()
                                        .onAppear(perform: {
                            model.beginLesson(index)
                        }), label: {
                            ContentViewRow(index: index)
                        })
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
