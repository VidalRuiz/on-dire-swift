//
//  NetworkChecker.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 10/05/25.
//
import Foundation
import Network

/// Utilidad para verificar si el dispositivo tiene acceso a Internet.
/// Usa `NWPathMonitor` de la librería `Network` para detectar la conectividad de red en el momento.
class NetworkChecker {
    /// Verifica de forma síncrona si hay conexión activa a Internet.
    ///
    /// - Returns: `true` si el dispositivo tiene una conexión válida a la red, `false` en caso contrario.
    /// - Nota: Este método no observa la red continuamente, solo consulta en el instante de la llamada.
    static func isConnectedToInternet() -> Bool {
        let monitor = NWPathMonitor()
        let semaphore = DispatchSemaphore(value: 0)
        var isConnected = false

        monitor.pathUpdateHandler = { path in
            isConnected = path.status == .satisfied
            semaphore.signal()
        }

        let queue = DispatchQueue(label: "NetworkChecker")
        monitor.start(queue: queue)

        // Esperar hasta que pathUpdateHandler se dispare (con timeout de 0.5 segundos)
        _ = semaphore.wait(timeout: .now() + 0.5)
        monitor.cancel()

        return isConnected
    }
}
