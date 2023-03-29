//
//  AccountView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()

    var body: some View {
        NavigationView {
            
            Form(){
                Section("Personel Information") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("E mail", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate,displayedComponents: .date)
                         

                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                }
                
                Section("Request") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                        
                }.tint(.accentColor)

                 
            }
            .navigationTitle("👨🏼‍💼Account")

        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .navigationViewStyle(.stack)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
      
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
