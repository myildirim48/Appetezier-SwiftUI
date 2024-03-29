//
//  AppetezierListViewModel.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

@MainActor final class AppetezierListViewModel: ObservableObject {
    @Published var appetezier : [AppetezierModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetezier : AppetezierModel?
  
    
    func getApeteziers() {
        isLoading = true
        Task{
            do {
                appetezier = try await NetworkManager.shared.getAppeteziers()
                isLoading = false
            } catch {
                
                if let apError = error as? APError {
                    switch apError {
                    case .invalidUrl:
                        alertItem = AlertContext.invalidURL
                    case .inlalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
    
    
    
//    func getApeteziers() {
//
//        isLoading = true
//
//        NetworkManager.shared.getAppeteziers { result in
//
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let success):
//                    self.appetezier = success
//
//                case .failure(let error):
//                    switch error {
//                    case .inlalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .invalidUrl:
//                        alertItem = AlertContext.invalidURL
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//
//            }
//            }
//    }
}
