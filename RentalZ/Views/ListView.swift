//
//  ListView.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 11/11/2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var addNewPropertyView = false
    
    var body: some View {
        List {
            Section(header: Text("List of properties")) {
                if (listViewModel.items.count != 0) {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                else {
                    HStack {
                        Text("There are no properties here...")
                        
                    }
                }
                
            }.headerProminence(.increased)
            
        }
        
        .navigationTitle("RentalZ")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    addNewPropertyView.toggle()
                }.sheet(isPresented: $addNewPropertyView) {
                    AddView(addNewPropertyView: self.$addNewPropertyView)
                }
                
                
            }
        }
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


