//
//  ApiErrorResponse.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Representa la estructura de error estándar que puede devolver la API de Ondire.
/// Incluye un código técnico y un mensaje legible.
struct ApiErrorResponse: Codable {
    let error: ErrorDetail
}

/// Contiene los detalles del error retornado por el backend.
struct ErrorDetail: Codable {
    let code: String
    let message: String
}
