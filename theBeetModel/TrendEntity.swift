import Himotoki

public struct TrendEntity {
    public let events: String
    
    public let name: String
    public let promotedContent: String
    public let query: String
    public let url: String
    
}

// MARK: Decodable
extension TrendEntity: Decodable {
    public static func decode(e: Extractor) throws -> TrendEntity {
        
        return try build(TrendEntity.init)(
            e <| "events",
            
            e <| "name",
            e <| "promoted_content",
            e <| "query",
            e <| "url"
        )
    }
}