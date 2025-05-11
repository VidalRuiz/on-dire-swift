//
//  ApiConstants.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//
import Foundation

enum ApiConstants {
    static let baseURL = "https://api.ondire.com"

    enum Endpoint {
        static let healthStatus = "/api/health"
        // Puedes agregar más: login, register, etc.
        static let registerUser = "/api/access/users/register"
    }
}
