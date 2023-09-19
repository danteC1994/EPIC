//
//  Monitor.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

protocol Monitor {
    var isConnected: PassthroughSubject<Bool, Never> { get }
    
    func startMonitoring()
}
