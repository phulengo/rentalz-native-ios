//
//  AddView.swift
//  RentalZ
//
//  Created by Phu Le Ngo on 11/11/2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    // Basic info section
    @State var propertyName = ""
    @State var propertyAddress = ""
    @State var propertyDateTimeAdded = Date()
    
    // Detail info section
    @State var propertyType = ""
    @State var bedroomAmount = 1
    @State var furnitureType = ""
    
    // Price & note section
    @State var propertyMonthlyPrice = ""
    @State var propertyNote = ""
    
    // Reporter section
    @State var reporterName = ""
    
    // Static data generated
    let propertyTypesColelction = ["Apartment", "House", "Boutique hotel", "Bungalow", "Flat", "Unique Space"]
    let bedroomTypesCollection = ["Master", "Children", "Guest"]
    let furnitureTypesColelction = ["Furnished", "Unfunished", "Part furnished"]
    
    
    // Formatter configuration
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    // Validation - Save button
    var disabledSaveButton: Bool {
        propertyName.isEmpty || propertyAddress.isEmpty || propertyType.isEmpty || String(bedroomAmount).isEmpty || dateFormatter.string(from:propertyDateTimeAdded).isEmpty || String(propertyMonthlyPrice).isEmpty || reporterName.isEmpty
    }
    
    // Validation - Section 1
    var isPropertyNameEmpty: Bool {
        propertyName.isEmpty
    }
    
    var isPropertyAddressEmpty: Bool {
        propertyAddress.isEmpty
    }
    
    var isPropertyNameAddressEmpty: Bool {
        propertyName.isEmpty && propertyAddress.isEmpty
    }
    
    // Validation - Section 2
    var isPropertyTypeEmpty: Bool {
        propertyType.isEmpty
    }
    
    // Validation - Section 3
    var isPropertyMonthlyPriceEmpty: Bool {
        propertyMonthlyPrice.isEmpty
    }
    
    // Validation - Section 4
    var isReporterNameEmpty: Bool {
        reporterName.isEmpty
    }
    
    @State private var isConfirmationDialogShow = false
    @Binding var addNewPropertyView: Bool
    
    var body: some View {
        
        NavigationView {
            Form {
                // Basic Information
                Section(header: Text("Basic information"), footer: Text("\(isPropertyNameAddressEmpty ? "Property's name & address cannot be blank": isPropertyNameEmpty ? "Property's name cannot be blank": isPropertyAddressEmpty ? "Property's address cannot be blank":"" )").foregroundColor(Color.red)) {
                    HStack {
                        Image(systemName: "homekit")
                        TextField("Enter the name of your property", text: $propertyName)
                    }
                    HStack {
                        Image(systemName: "location")
                        TextField("Enter the address of your property", text: $propertyAddress)
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        DatePicker("Date", selection: $propertyDateTimeAdded, displayedComponents: [.date, .hourAndMinute])
                    }
                }
                
                // A few more details
                Section(header: Text("A few more details"), footer: Text("\(isPropertyTypeEmpty ? "Property's type cannot be blank" : "")").foregroundColor(Color.red)) {
                    
                    HStack {
                        Image(systemName: "building.2.crop.circle")
                        Picker("Select type of property", selection: $propertyType) {
                            ForEach(propertyTypesColelction, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    HStack {
                        Image(systemName: "bed.double")
                        Stepper(value: $bedroomAmount , in: 0...10) {
                            Text("Number of bedrooms: \(bedroomAmount)")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "studentdesk")
                        Picker("Select type of furniture", selection: $furnitureType) {
                            ForEach(furnitureTypesColelction, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    
                }
                
                // Price & Notes
                Section(header: Text("Price & Notes"), footer: Text("\(isPropertyMonthlyPriceEmpty ? "Property's monthly rent price cannot be blank" : "")").foregroundColor(Color.red)) {
                    
                    HStack {
                        Image(systemName: "dollarsign.circle")
                        TextField("Enter the monthly rent price of your property ", text: $propertyMonthlyPrice).keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Image(systemName: "square.and.pencil")
                        TextField("Enter notes about this property", text: $propertyNote)
                    }
                    
                    
                    
                }
                
                // Reporter
                Section(header: Text("Reporter"), footer: Text("\(isReporterNameEmpty ? "Reporter's name cannot be blank" : "")").foregroundColor(Color.red)) {
                    
                    HStack {
                        Image(systemName: "person")
                        TextField("Enter the name of the reporter", text: $reporterName)
                    }
                    
                }
                
                Section(footer: Text("\(disabledSaveButton ? "Some fields are missing, please check it again" : "")").foregroundColor(Color.red)) {
                    Button(action: {isConfirmationDialogShow = true}) {
                        Text("Save Property")
                    }
                    .confirmationDialog("Did you finish editting?", isPresented: $isConfirmationDialogShow, titleVisibility: .visible) {
                        Button("Yes", role: .destructive) {
                            withAnimation {
                                saveButtonPressed()
                                isConfirmationDialogShow = false
                            }
                        }
                    }
                    .disabled(disabledSaveButton)
                    .frame(maxWidth: .infinity)
                }
                
            }
            //            .navigationTitle("Add new property")
            //            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarTitle(Text("Add new property"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.addNewPropertyView.toggle()
            }) {
                Text("Cancel")
            })
        }
        
        
        
        
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(name: propertyName, address: propertyAddress, date: propertyDateTimeAdded, type: propertyType, bedroom: Int(bedroomAmount), furniture: furnitureType, price: Int(propertyMonthlyPrice), note: propertyNote, reporter: reporterName)
        presentationMode.wrappedValue.dismiss()
    }
    
}

//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddView()
//        }
//        .environmentObject(ListViewModel())
//    }
//}
