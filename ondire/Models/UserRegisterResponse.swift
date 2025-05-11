//
//  UserRegisterResponse.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Representa la respuesta que devuelve el servidor al registrar exitosamente un usuario.
/// Utilizada por RegisterViewModel para navegar o mostrar mensajes al usuario.
struct UserRegisterResponse: Codable {
    /// Identificador único del usuario recién creado.
    let userId: Int

    /// Correo electrónico del usuario.
    let email: String

    /// Indica si el correo fue verificado automáticamente (por ejemplo, con Google o Apple).
    let isEmailVerified: Bool

    /// Mensaje informativo que puede mostrarse al usuario (por ejemplo: "Cuenta creada exitosamente.").
    let message: String
}
