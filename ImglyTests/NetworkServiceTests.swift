//
//  NetworkServiceTests.swift
//  ImglyTests
//
//  Created by Hayk Hayrapetyan on 26.12.23.
//

import XCTest
import Mocker
import Alamofire
import Combine
@testable import Imgly

final class NetworkServiceTests: XCTestCase {

    // MARK: Typealiases

    private typealias EmptyPublisher = Combine.Empty<ListModel, Never>

    // MARK: Private properties

    private var networkService: NetworkService!
    private var cancellable: AnyCancellable?

    // MARK: Lifecycle methods

    override func setUp() {
        super.setUp()

        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let session = Session(configuration: configuration)

        networkService = DefaultNetworkService(session: session)
    }

    override func tearDown() {
        super.tearDown()

        networkService = nil
        cancellable = nil

        Mocker.removeAll()
    }

    // MARK: Test methods

    func testRequestNoConnection() {
        let request = ListRequest()
        let expectation = expectation(description: "Request should fail with noConnection error")
        let mock = Mock(url: URL(string: request.url)!, dataType: .json, statusCode: 0,
                        data: [.get: Data()], requestError: URLError(.notConnectedToInternet))

        mock.register()

        cancellable = networkService.request(request)
            .catch { error in
                guard case .noConnection = error else {
                    XCTFail("Request should have failed with noConnection error")

                    return EmptyPublisher()
                }

                expectation.fulfill()

                return EmptyPublisher()
            }
            .sink { _ in XCTFail("Request should have failed with noConnection error") }

        wait(for: [expectation], timeout: 3)
    }

    func testRequestDataNotAvailable() {
        let request = ListRequest()
        let expectation = expectation(description: "Request should fail with dataNotAvailable error")
        let error = AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
        let mock = Mock(url: URL(string: request.url)!, dataType: .json, statusCode: 404,
                        data: [.get: Data()], requestError: error)

        mock.register()

        cancellable = networkService.request(request)
            .catch { error in
                guard case .dataNotAvailable = error else {
                    XCTFail("Request should have failed with dataNotAvailable error")

                    return EmptyPublisher()
                }

                expectation.fulfill()

                return EmptyPublisher()
            }
            .sink { _ in XCTFail("Request should have failed with dataNotAvailable error") }

        wait(for: [expectation], timeout: 3)
    }
}
