//
//  ServiceModule.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 19/9/22.
//

import Foundation
import Alamofire

struct ServiceModule {
    var url: String
    var method: HTTPMethod
    var parameters: Parameters?
    var encoder: ParameterEncoder
    var headers: HTTPHeaders?
    var interceptor: RequestInterceptor?
}
