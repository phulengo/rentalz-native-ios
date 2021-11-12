//
//  ListViewModel.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 12/11/2021.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
                
        self.items = savedItems!
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(name: String, address: String?, date: Date?, type: String?, bedroom: Int?, furniture: String?,  price: Int?, note: String?, reporter: String?) {
        let newItem = ItemModel(propertyName: name, propertyAddress: address, propertyDateTimeAdded: date, propertyType: type, bedroomAmount: bedroom, furnitureType: furniture, propertyMonthlyPrice: price, propertyNote: note, reporterName: reporter)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
