//
//  NetworkMonitor.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine
import Network

class NetworkMonitor: Monitor {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    private(set) var isConnected = PassthroughSubject<Bool, Never>()

    init() {
        startMonitoring()
    }

    func startMonitoring() {
        networkMonitor.pathUpdateHandler = { path in
            Task {
                await MainActor.run {
                    self.isConnected.send(path.status == .satisfied)
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
