//
//  AlamofireWrapper.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 19/9/22.
//

import Foundation
import Alamofire
import RxSwift

struct House: Decodable {
    var house: String
    var house2: String
}

struct ErrorResponse: Error {
    let statusCode: Int?
    let data: Data?
    let error: Error?
}

class Response<T> {

    let statusCode: Int
    let header: [AnyHashable: Any]
    let body: T?

    init(statusCode: Int, header: [AnyHashable: Any], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        self.init(statusCode: response.statusCode, header: rawHeader, body: body)
    }
}


class NetworkingClient<T: Decodable> {

    var url: URLConvertible
    var method: HTTPMethod
    var parameters: [String: Any]?
    var headers: HTTPHeaders
    var isBody: Bool
    var dateFormat: String?

    init(url: URLConvertible,
         method: HTTPMethod,
         parameters: [String: Any]? = nil,
         headers: [String: String] = [:],
         isBody: Bool
    ) {

        self.url = url
        self.method = method
        self.parameters = parameters
        self.isBody = isBody
        self.headers = HTTPHeaders(headers)
    }

    func execute() -> Observable<Response<T>> {
        let dataRequest = AF.request(
            self.url,
            method: self.method,
            parameters: self.parameters,
            encoding: isBody ? JSONEncoding() : URLEncoding(),
            headers: self.headers
        )
        return performRequest(dataRequest: dataRequest)
    }

    func performRequest(dataRequest: DataRequest) -> Observable<Response<T>> {
        return Observable.create { observer -> Disposable in
            dataRequest.validate()
                .responseData { dataResponse in

                    switch (dataResponse.response, dataResponse.error) {
                    case (.some(let response), .none):

                        guard let data = dataResponse.data else {
                            return
                        }

                        let decoded: (decodedObj: T?, error: Error?) = CodableHelper.decode(T.self,
                                                                                            data: data)
                        if let error = decoded.error {
                            observer.onError(ErrorResponse(statusCode: 500, data: nil, error: error))
                        } else {
                            observer.onNext(Response(response: response, body: decoded.decodedObj))
                            observer.onCompleted()
                        }
                    case (.none, .none):
                        observer.onError(ErrorResponse(statusCode: 500, data: nil, error: nil))
                    case (_, .some(let error)):
                        observer.onError(ErrorResponse(statusCode: 500, data: nil, error: error))
                    }
                }
            return Disposables.create()
        }
    }
}



