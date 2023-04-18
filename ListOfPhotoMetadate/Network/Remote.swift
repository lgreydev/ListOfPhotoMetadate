//
//  Remote.swift
//  ListOfPhotoMetadate
//
//  Created by Sergey Lukaschuk on 2023-04-18.
//

import Foundation
import Combine

struct LoadingError: Error {}

class Remote1<A>: ObservableObject {
    
    @Published var result: Result<A, Error>? = nil // nil means not loaded yet
    var value: A? { try? result?.get() }
    
    let url: URL
    let transform: (Data) -> A?

    init(url: URL, transform: @escaping (Data) -> A?) {
        self.url = url
        self.transform = transform
    }

    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let d = data, let v = self.transform(d) {
                    self.result = .success(v)
                } else {
                    self.result = .failure(LoadingError())
                }
            }
        }.resume()
    }
}


class Remote2<T: Decodable>: ObservableObject {
    
    let url: URL
    let decoder = JSONDecoder()
    
    @Published var data: T?
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error loading data from network: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try self?.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    self?.data = decodedData
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

