//
//  UITestConfig.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 31.12.23.
//

import Foundation
import Alamofire
import Mocker

struct UITestConfig {
    static var session: Session {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])

        return Session(configuration: configuration)
    }

    static func registerMock(withUrl urlString: String) {
        guard let url = URL(string: urlString),
              let json = ProcessInfo.processInfo.environment[urlString] else { return }

        let data = Data(json.utf8)
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.get: data])

        mock.register()
    }

    static var isUITestingMode: Bool {
        return CommandLine.arguments.contains("enable-UITesting")
    }
}
