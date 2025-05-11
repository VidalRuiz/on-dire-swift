//
//  UserApiService.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Encargado de las llamadas a la API relacionadas con la creación y autenticación de usuarios.
/// Este servicio se comunica con el backend para registrar nuevos usuarios y manejar flujos de cuenta.
class UserApiService {
    
    /// Registra un nuevo usuario con proveedor 'local'.
    /// - Parameters:
    ///   - request: Objeto `UserRegisterRequest` con los datos de registro.
    ///   - completion: Callback con resultado exitoso `UserRegisterResponse` o error.
    func registerUser(_ request: UserRegisterRequest, completion: @escaping (Result<UserRegisterResponse, Error>) -> Void) {
        guard NetworkChecker.isConnectedToInternet() else {
            completion(.failure(ApiError.noInternet))
            return
        }

        guard let url = URL(string: ApiConstants.baseURL + ApiConstants.Endpoint.registerUser) else {
            completion(.failure(ApiError.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let languageCode = Locale.preferredLanguages.first ?? "es"
        urlRequest.addValue(languageCode, forHTTPHeaderField: "Accept-Language")

        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(UserRegisterResponse.self, from: data)
                completion(.success(response))
            } catch {
                if let apiError = try? JSONDecoder().decode(ApiErrorResponse.self, from: data) {
                    let customError = NSError(domain: "", code: 400, userInfo: [
                        NSLocalizedDescriptionKey: apiError.error.message
                    ])
                    completion(.failure(customError))
                } else {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
