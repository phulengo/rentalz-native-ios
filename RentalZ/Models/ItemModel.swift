//
//  ItemModel.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 11/11/2021.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString // Create random string id
    
    // Basic info section
    let propertyName: String
    let propertyAddress: String?
    let propertyDateTimeAdded: Date?
    
    // Detail info section
    let propertyType: String?
    let bedroomAmount: Int?
    let furnitureType: String?
    
    // Price & note section
    let propertyMonthlyPrice: Int?
    let propertyNote: String?
    
    // Reporter section
    let reporterName: String?
}
