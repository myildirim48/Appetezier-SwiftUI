//
//  NetworkManager.swift
//  Appeteziers
//
//  Created by YILDIRIM on 28.03.2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage >()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetezierURL = baseUrl + "appetizers"
    
    private init() { }
    
    func getAppeteziers()  async throws -> [AppetezierModel] {
        guard let url = URL(string: appetezierURL) else { throw APError.invalidUrl }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        //                return
        //            }
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetezierResponse.self, from: data).request
        }catch {
            throw APError.invalidData
        }
        
    }
    
    
    //MARK: -  Download Image
    func downloadImage(urlString: String, completed: @escaping(UIImage?)-> Void){
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}
