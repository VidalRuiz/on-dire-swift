//
//  Validator.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

//
//  Validator.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Clase de utilidades para validaciones de campos comunes en formularios.
/// Contiene métodos estáticos reutilizables en diferentes ViewModels o servicios.
enum Validator {
    
    static func validateFullName(_ value: String) -> String? {
        value.trimmingCharacters(in: .whitespaces).isEmpty
            ? AppStrings.errorEmptyFullName
            : nil
    }
    
    static func validateEmail(_ value: String) -> String? {
        guard !value.trimmingCharacters(in: .whitespaces).isEmpty else {
            return AppStrings.errorEmptyEmail
        }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value) ? nil : AppStrings.errorInvalidEmail
    }
    
    static func validatePassword(_ value: String, minLength: Int = 6) -> String? {
        value.count < minLength
            ? AppStrings.errorWeakPassword
            : nil
    }
    
    static func validateTermsAccepted(_ value: Bool) -> String? {
        value ? nil : AppStrings.errorTermsNotAccepted
    }
}
