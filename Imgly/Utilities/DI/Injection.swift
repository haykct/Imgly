//
//  Injection.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Swinject

/// A dependency injection container.
class Injection {
    // MARK: Public properties

    static let shared = Injection()

    lazy var container = Container { container in
        register(using: container)
    }

    // MARK: Initializers

    private init() {}
}

extension Injection {
    private func register(using container: Container) {
        container.register(NetworkService.self) { _ in
            DefaultNetworkService()
        }
        .inObjectScope(.container)
    }
}
