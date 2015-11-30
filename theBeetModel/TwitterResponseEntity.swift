import Himotoki

public struct TwitterResponseEntity {
    public let trends: [TrendEntity]
}

// MARK: Decodable
extension TwitterResponseEntity: Decodable {
    public static func decode(e: Extractor) throws -> TwitterResponseEntity {
        return try build(TwitterResponseEntity.init)(
            e <|| "trends"
        )
    }
}