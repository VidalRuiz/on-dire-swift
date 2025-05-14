//
//  ApiError.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

enum ApiError: Error {
    case noInternet
    case invalidUrl
    case noData
    case decodingFailed
    case serverError(String) // opcional si quieres mostrar mensajes personalizados
}
