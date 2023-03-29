//
//  Alert.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI
struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: -  Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid.")
                                       , dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again."),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("This was an issue connecting to the server. If this persist, please contact with support."),
                                      dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    //MARK: -  Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your Email is correct."),
                                            dismissButton: .default(Text("OK")))
    
    
    static let userSavedSuccess = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was saved successfully."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dismissButton: .default(Text("OK")))
    
}
