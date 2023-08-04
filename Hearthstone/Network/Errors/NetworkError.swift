
import Foundation

public enum NetworkError: Error {
    case parametersNil
    case serializationError
    case missingURL
    
    // TODO: Add localization Constants
    var localizedDescription: String {
        switch self {
            case .parametersNil: return "Parameters were nil."
            case .serializationError: return "Parameter serialization failed."
            case .missingURL: return "URL is nil."
        }
    }
}
