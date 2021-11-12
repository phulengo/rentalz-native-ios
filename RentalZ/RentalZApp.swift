//
//  RentalZApp.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 06/11/2021.
//

import SwiftUI

/*
MVVM Architecture

Model - data point
View - UI
ViewModel - Manage Models for View
 
*/

@main
struct RentalZApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
