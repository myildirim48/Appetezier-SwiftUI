//
//  RemoteImage.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import SwiftUI
final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadFromUrlString(urlString:String){
        NetworkManager.shared.downloadImage(urlString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage )
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("placeholder-food").resizable()
    }
}

struct AppetezierRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{ imageLoader.loadFromUrlString(urlString: urlString) }
        
    }
}
