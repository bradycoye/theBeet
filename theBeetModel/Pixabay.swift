internal struct Pixabay {
    internal static let apiURL = "https://pixabay.com/api/"
    
    internal static var requestParameters: [String: AnyObject] {
        return [
            "username": Config.apiUsername,
            "key": Config.apiKey,
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50,
        ]
    }
}

extension Pixabay {
    private struct Config {
        private static let apiUsername = "bccoye" // Fill with your own username.
        private static let apiKey = "a66e7805f655ea4318c6" // Fill with your own API key.
    }
}
