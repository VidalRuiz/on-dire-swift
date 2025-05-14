//
//  UserLoginResponse.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 13/05/25.
//

import Foundation

struct UserLoginResponse: Codable {
    let userId: Int
    let email: String
    let fullName: String?
    let language: String
    let roleId: Int
    let isEmailVerified: Bool
    let token: String
}
