
//
//  UserRegisterRequest.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Representa la estructura de datos que se envía al endpoint `/api/access/users/register`.
/// Este modelo es utilizado por ApiService para registrar una nueva cuenta de usuario.
/// Compatible con Swift Codable para su uso directo en solicitudes JSON.
struct UserRegisterRequest: Codable {
    /// Nombre completo del usuario.
    let fullName: String

    /// Correo electrónico del usuario.
    let email: String

    /// Contraseña elegida por el usuario (solo aplica para AuthProvider `local`).
    let password: String

    /// Proveedor de autenticación utilizado (por ejemplo: `"local"`, `"google"`, `"apple"`).
    let authProvider: String

    /// Identificador del proveedor externo. En el caso de `local`, debe ser igual al correo.
    let providerId: String
}

