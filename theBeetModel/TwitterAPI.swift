internal struct TwitterAPI {
    internal static let apiURL = "https://api.twitter.com/1.1/trends/closest.json"
    
    internal static var requestParameters: [String: AnyObject] {
        return [
            "lat": "34.9249",
            "long": "-82.4331"
        ]
    }
}

extension TwitterAPI {
    private struct Config {
        private static let apiUsername = "bccoye" // Fill with your own username.
        private static let apiKey = "a66e7805f655ea4318c6" // Fill with your own API key.
    }
}