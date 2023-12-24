//
//  NetworkService.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Foundation
import Alamofire
import Combine

protocol NetworkService {
    func request<Response>(_ request: Request) -> AnyPublisher<Response, NetworkError> where Response: Decodable
}

final class DefaultNetworkService: NetworkService {
    // MARK: Private properties

    private let session: Session

    // MARK: Initializers

    init(session: Session = AF) {
        self.session = session
    }

    // MARK: Public methods

    func request<Response>(_ request: Request) -> AnyPublisher<Response, NetworkError> where Response: Decodable {
        session
            .request(request.url)
            .validate(statusCode: 200 ... 399)
            .publishData()
            .value()
            .mapError { error in
                if let urlError = error.underlyingError as? URLError,
                   urlError.code == .notConnectedToInternet {
                    return NetworkError.noConnection
                }

                return .dataNotAvailable
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { error in
                if let networkError = error as? NetworkError { return networkError }

                return .unableToDecode
            }
            .eraseToAnyPublisher()
    }
}
