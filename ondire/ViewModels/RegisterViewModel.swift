//
//  RegisterViewModel.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// ViewModel responsable de manejar el estado y la lógica de registro de nuevos usuarios.
/// Utiliza `UserApiService` para comunicarse con la API y publica resultados para la interfaz.
@MainActor
class RegisterViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var successMessage: String?
    @Published var accountCreated = false

    private let api = UserApiService()

    /// Llama a la API para registrar un nuevo usuario usando proveedor `local`.
    /// - Parameters:
    ///   - fullName: Nombre completo del usuario.
    ///   - email: Correo electrónico.
    ///   - password: Contraseña definida por el usuario.
    ///   - termsAccepted: Indica si el usuario aceptó los términos y condiciones.
    func register(fullName: String, email: String, password: String, termsAccepted: Bool) {
        errorMessage = nil
        successMessage = nil

        if let error = Validator.validateFullName(fullName)
            ?? Validator.validateEmail(email)
            ?? Validator.validatePassword(password)
            ?? Validator.validateTermsAccepted(termsAccepted) {
            errorMessage = error
            return
        }

        isLoading = true

        let request = UserRegisterRequest(
            fullName: fullName,
            email: email,
            password: password,
            authProvider: "local",
            providerId: email
        )

        api.registerUser(request) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.successMessage = response.message
                    self?.accountCreated = true
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
