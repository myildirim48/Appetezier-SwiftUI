//
//  AppetezierListView.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI

struct AppetezierListView: View {
    
    @StateObject private var viewModel = AppetezierListViewModel()

    
    var body: some View {

        ZStack {
            NavigationView {
                    List(viewModel.appetezier) { appetezier in
                        AppetezierListCell(appetezier: appetezier)
                            .listRowSeparator(.hidden)

                            .onTapGesture {
                                viewModel.isShowingDetail = true
                                viewModel.selectedAppetezier = appetezier
                            }
                          
                    }
                    .navigationTitle("🍟 Appeteziers")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)

                }
                .task {
                    viewModel.getApeteziers()
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetezierDetailView(isShowingDetail: $viewModel.isShowingDetail, appetezier: viewModel.selectedAppetezier!)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }

    }

}
struct AppetezierListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetezierListView()
    }
}

