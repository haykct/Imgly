//
//  NetworkError.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

/// A type to handle network errors.
enum NetworkError: Error, Equatable {
    case noConnection
    case dataNotAvailable
    case unableToDecode

    var descriptionKey: String {
        switch self {
        case .noConnection:
            return LocalizationKeys.noInternet
        case .dataNotAvailable:
            return LocalizationKeys.tryLater
        case .unableToDecode:
            return LocalizationKeys.unexpectedFormat
        }
    }
}
