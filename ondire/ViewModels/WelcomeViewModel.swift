//
//  WelcomeViewModel.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation
import SwiftUI

@MainActor
class WelcomeViewModel: ObservableObject {
    @Published var apiStatusText: String = ""
    @Published var isApiAvailable: Bool = true
    @Published var isLoading: Bool = false
    
    func fetchApiStatus() {
        isLoading = true
        ApiService.shared.fetchHealthStatus { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let status):
                    self?.apiStatusText = String(format: AppStrings.appStatus, status.status)
                    self?.isApiAvailable = true
                case .failure(let error):
                    self?.apiStatusText = AppStrings.offlineStatus
                    self?.isApiAvailable = false
                    print("Error al obtener status de la API: \(error.localizedDescription)")
                }
            }
        }
    }
}
