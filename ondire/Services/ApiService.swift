//
//  ApiService.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Servicio responsable de interactuar con la API de Ondire.
/// Implementa métodos para consumir endpoints HTTP y procesar sus respuestas.
/// Esta clase sigue el patrón Singleton para garantizar una instancia compartida.
class ApiService {
    static let shared = ApiService()
    private init() {}

    /// Realiza una petición al endpoint `/api/health` para obtener el estado actual del servidor.
    ///
    /// - Parameter completion: Closure que devuelve un resultado con un objeto `HealthStatus` en caso de éxito,
    ///   o un error (`ApiError` o `Error`) en caso de fallo (sin red, URL inválida, error de servidor, etc).
    func fetchHealthStatus(completion: @escaping (Result<HealthStatus, Error>) -> Void) {
        guard NetworkChecker.isConnectedToInternet() else {
            completion(.failure(ApiError.noInternet))
            return
        }

        guard let url = URL(string: ApiConstants.baseURL + ApiConstants.Endpoint.healthStatus) else {
            completion(.failure(ApiError.invalidUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let status = try decoder.decode(HealthStatus.self, from: data)
                completion(.success(status))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
