//
//  NetworkService.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 05.04.2021.
//

import UIKit

class NetwokService {

    private let baseURL = "https://rickandmortyapi.com/api/character"

    func charactersRequest(completion: @escaping ([Result]) -> Void) {
        let url = URL(string: baseURL)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong. The data nil")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(decodedData.results)
            } catch {
                print("Something went wrong")
            }
        }.resume()
    }

    func characterByIdRequest(id: Int, completion: @escaping (Details) -> Void) {
            let url = URL(string: "\(baseURL)/\(String(describing: id))")!
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil, response != nil else {
                    print("Something went wrong. The data nil")
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(Details.self, from: data)
                    completion(decodedData)

                } catch {
                    print("Something went wrong")
                }
            }.resume()
    }

}
