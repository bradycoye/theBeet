import Himotoki

public struct TrendEntity {
    
    public let name: String
    public let query: String
    public let url: String
    
}

// MARK: Decodable
extension TrendEntity: Decodable {
    public static func decode(e: Extractor) throws -> TrendEntity {
        
        return try build(TrendEntity.init)(
            
            e <| "name",
            e <| "query",
            e <| "url"
        )
    }
}