//
//  Request.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Alamofire

protocol Request {
    var baseURL: String { get }
    var path: String { get }
}

extension Request {
    var url: String { baseURL + path }
    var baseURL: String { BaseUrls.imglyApi }
}
