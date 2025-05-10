//
//  HealthStatus.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//

import Foundation

/// Representa el estado de salud del servidor de la API.
/// Esta estructura es utilizada para decodificar la respuesta del endpoint `/api/health`.
/// Permite saber si el servidor está disponible, en qué entorno está ejecutándose y la hora actual del servidor.
struct HealthStatus: Codable {
    /// Estado general del servidor. El valor "Healthy" indica que está disponible y operativo.
    let status: String

    /// Hora actual del servidor en formato UTC (ISO8601). Puede usarse para sincronización.
    let utcTime: String

    /// Entorno en el que corre la API. Actualmente solo se usa "Production".
    let environment: String

    /// Versión actual del backend expuesta por el servidor.
    let version: String
}
