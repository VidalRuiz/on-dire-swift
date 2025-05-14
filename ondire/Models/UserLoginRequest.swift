//
//  UserLoginRequest.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 13/05/25.
//

import Foundation

struct UserLoginRequest: Codable {
    let email: String
    let passwordHash: String
    let authProvider: String
    let providerId: String
}
