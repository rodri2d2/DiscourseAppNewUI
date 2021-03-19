//
//  APIClient.swift
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//  Revisado por Roberto Garrido on 8 de Marzo de 2020
//

import Foundation
import UIKit

enum SessionAPIError: Error {
    case httpError(Int)
    case apiError(ApiError)
}

/// Clase de utilidad para llamar al API. El método Send recibe una Request que implementa APIRequest y tiene un tipo Response asociado
final class SessionAPI {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func send<T: APIRequest>(request: T, completion: @escaping(Result<T.Response?, Error>) -> ()) {
        let request = request.requestWithBaseUrl()
        
        let task = session.dataTask(with: request) { data, response, error in
            // Early exit si la respuesta tiene código de error
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 && httpResponse.statusCode < 500 {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(ApiError.self, from: data)
                        DispatchQueue.main.async {
                            completion(.failure(SessionAPIError.apiError(model)))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(SessionAPIError.httpError(httpResponse.statusCode)))
                    }
                }
                return
            }

            // Si vuelven datos, los intentamos decodificar
            if let data = data, data.count > 0 {
                do {
                    let model = try JSONDecoder().decode(T.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                // Retornamos en el caso success
                DispatchQueue.main.async {
                    completion(.success(nil))
                }
            }
        }
        task.resume()
    }
}

struct ApiError: Codable {
    let action: String?
    let errors: [String]?
}
