//
//  AccountView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedFied: FormTextfield?
    
    enum FormTextfield {
        case firstName,lastName,email
    }

    var body: some View {
        NavigationView {
            
            Form{
                Section("Personel Information") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedFied,equals: .firstName)
                        .onSubmit { focusedFied = .lastName }
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedFied,equals: .lastName)
                        .onSubmit { focusedFied = .email }
                    
                    TextField("E mail", text: $viewModel.user.email)
                        .focused($focusedFied,equals: .email)
                        .onSubmit { focusedFied = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                                             
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in:Date().oneHundredTenYearsAgo...Date().eighteenYearAgo,
                               displayedComponents: .date)

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
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dissmis") { focusedFied = nil }
                }
            }

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
