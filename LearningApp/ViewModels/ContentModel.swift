//
//  ContentModel.swift
//  LearningApp
//
//  Created by Mason Garrett on 2022-01-25.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init () {
        
        getLocalData()
    }
    
    // MARK: Data Methods
    
    func getLocalData() {
        
        // Get a url to the .json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into the data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
        } catch {
            // Log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        } catch {
            // Log error
            print("Couldn't parse style data")
        }
    }
    
    // MARK: Data Navigation Methods
    
    func beginModule(_ moduleid: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
