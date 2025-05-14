//
//  LoginViewModel.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 13/05/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var loginSuccess = false
    @Published var errorMessage: String?

    let apiService = UserApiService()

    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil

        let request = UserLoginRequest(
            email: email,
            passwordHash: password,
            authProvider: "local",
            providerId: email
        )

        apiService.loginUser(request: request) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.loginSuccess = true
                    UserDefaults.standard.set(response.token, forKey: "userToken")
                    UserDefaults.standard.set(response.fullName ?? "", forKey: "fullName")
                    // ... otros campos que desees guardar
                case .failure(let error):
                    if let nsError = error as NSError? {
                        let message = nsError.localizedDescription

                        switch message {
                        case "user_not_found":
                            self?.errorMessage = AppStrings.loginErrorUserNotFound
                        case "invalid_password":
                            self?.errorMessage = AppStrings.loginErrorInvalidPassword
                        case "user_inactive":
                            self?.errorMessage = AppStrings.loginErrorUserInactive
                        default:
                            self?.errorMessage = AppStrings.loginErrorGeneric
                        }
                    } else {
                        self?.errorMessage = AppStrings.loginErrorGeneric
                    }
                }
            }
        }
    }
}
