// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import Get

final public class BgmClient {
    // Current user access token
    public private(set) var accessToken: String?
    public let configuration: Configuration

    private var _apiClient: APIClient!
    private let sessionConfiguration: URLSessionConfiguration
    private let delegate: APIClientDelegate?

    init(
        configuration: Configuration,
        sessionConfiguration: URLSessionConfiguration = .default,
        sessionDelegate: URLSessionDelegate? = nil,
        delegate: APIClientDelegate? = nil,
        accessToken: String? = nil
    ) {
        self.accessToken = accessToken
        self.configuration = configuration
        self.sessionConfiguration = sessionConfiguration
        self.delegate = delegate

        self._apiClient = APIClient(baseURL: URL(string: "http://api.bgm.tv")) { configuration in
            configuration.sessionConfiguration = sessionConfiguration
            configuration.delegate = self
            configuration.sessionDelegate = sessionDelegate
        }
    }

    public struct Configuration {
        let url: String
        let device: String

        init(url: String, device: String) {
            self.url = url
            self.device = device
        }
    }

    func authHeader() -> String {
        return "Bearer \(self.accessToken ?? "")"
    }
}

extension BgmClient: APIClientDelegate {
    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws
    {
        request.addValue(authHeader(), forHTTPHeaderField: "Authorization")

        try await delegate?.client(_apiClient, willSendRequest: &request)
    }

    public func client(
        _ client: APIClient, validateResponse response: HTTPURLResponse, data: Data,
        task: URLSessionTask
    ) throws {
        if let delegate {
            try delegate.client(_apiClient, validateResponse: response, data: data, task: task)
        } else {
            guard (200..<300).contains(response.statusCode) else {
                throw APIError.unacceptableStatusCode(response.statusCode)
            }
        }
    }

    public func client(
        _ client: APIClient, shouldRetry task: URLSessionTask, error: any Error, attempts: Int
    ) async throws -> Bool {
        try await delegate?.client(_apiClient, shouldRetry: task, error: error, attempts: attempts)
            ?? false
    }

    public func client<T>(_ client: APIClient, makeURLForRequest request: Request<T>) throws -> URL?
    {
        try delegate?.client(_apiClient, makeURLForRequest: request)
    }
}

extension BgmClient {
    public func send<T>(
        _ request: Request<T>,
        delegate: URLSessionDataDelegate? = nil,
        configure: ((inout URLRequest) throws -> Void)? = nil
    ) async throws -> Response<T> where T: Decodable {
        try await _apiClient.send(request, delegate: delegate, configure: configure)
    }
}

// MARK: ClientError

extension BgmClient {
    enum ClientError: Error {
        case noAccessTokenInResponse

        var localizedDescription: String {
            switch self {
            case .noAccessTokenInResponse:
                "No access token in authenticated response"
            }
        }
    }
}
