//
//  ListRowView.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 11/11/2021.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    @State var isEditing = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        HStack(alignment: .center) {
            //            HStack {
            //                Image(systemName: "house")
            //            }
            //            Spacer()
            VStack (alignment:.leading) {
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "homekit")
                    Text(item.propertyName)
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "building.2.crop.circle")
                    Text(item.propertyType!)
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "dollarsign.circle")
                    Text(String(item.propertyMonthlyPrice!))
                }
                Spacer()
            }
            Spacer()
            
            VStack (alignment:.leading) {
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "location")
                    Text(item.propertyAddress!)
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "bed.double")
                    Text(String(item.bedroomAmount!))
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "square.and.pencil")
                    Text(item.propertyNote!)
                }
                Spacer()
                
            }
            Spacer()
            VStack (alignment:.leading) {
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "calendar")
                    Text(dateFormatter.string(from:item.propertyDateTimeAdded!))
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "studentdesk")
                    Text(item.furnitureType!)
                }
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "person")
                    Text(item.reporterName!)
                }
                Spacer()
            }
        }
        .onTapGesture {
            self.isEditing = true
        }
        .sheet(isPresented: self.$isEditing) {
            EditView(item:self.item, isEditing: self.$isEditing)
        }
    }
    
    
}



//
//struct ListRowView_Previews: PreviewProvider {
//
//    static var item1 = ItemModel(propertyName: "House 1", propertyAddress: "District 6")
//
//
//    static var previews: some View {
//        Group {
//            ListRowView(item: item1)
//        }
//    }
//
//}
