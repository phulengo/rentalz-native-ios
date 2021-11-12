//
//  EditView.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 12/11/2021.
//

import SwiftUI

struct EditView: View {
    let item: ItemModel
    @EnvironmentObject var listViewModel:ListViewModel
    @Binding var isEditing: Bool
    
    var body: some View {
        NavigationView {
                    Text("This feature is updating...")
                    .navigationBarTitle(Text("Edit property"), displayMode: .inline)
                        .navigationBarItems(trailing: Button(action: {
                            print(item.reporterName!) // TODO: Future update with edit by tap
                            self.isEditing = false
                        }) {
                            Text("Done").bold()
                        })
                }
       
    }
    
}


//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView(isEditing: .constant(true))
//
//    }
//}
