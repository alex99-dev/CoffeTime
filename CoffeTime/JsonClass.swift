//
//  JsonClass.swift
//  CoffeTime
//
//  Created by Buliga Alexandru on 29.03.2021.
//

import Foundation
class JsonClass: ObservableObject {
    // 1.
    @Published var coffe = [CoffeCell]()
    
    init() {
        let url = URL(string: "https://jsonkeeper.com/b/LERU")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([CoffeCell].self, from: todoData)
                    DispatchQueue.main.async {
                        self.coffe = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
