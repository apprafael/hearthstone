//
//  HearthstoneAPI.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 01/08/23.
//

import Foundation

enum HearthStoneAPI {
    case getCards
}

extension HearthStoneAPI: EndPointType {
    var baseURL: URL {
        URL(string: "https://omgvamp-hearthstone-v1.p.rapidapi.com/")!
    }

    var path: String {
        switch self {
        case .getCards:
            return "cards"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getCards:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .getCards:
            return .requestParametersAndHeaders(bodyParameters: nil,
                                                bodyEncoding: .urlEncoding,
                                                urlParameters: .none,
                                                additionHeaders: headers)
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .getCards:
            return [
                "X-RapidAPI-Key": "85c5d2c234mshcac04daa0d4c284p160832jsn28bb81069000",
                "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
            ]
        }
    }
}
