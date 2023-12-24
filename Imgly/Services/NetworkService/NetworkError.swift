//
//  NetworkError.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

enum NetworkError: Error, Equatable {
    case noConnection
    case dataNotAvailable
    case unableToDecode

    var descriptionKey: String {
        switch self {
        case .noConnection:
            return "no_internet"
        case .dataNotAvailable:
            return "try_later"
        case .unableToDecode:
            return "unexpected_format"
        }
    }
}
