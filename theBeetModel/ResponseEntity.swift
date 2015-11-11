import Himotoki

public struct ResponseEntity {
    public let totalCount: Int64
    public let images: [ImageEntity]
}

// MARK: Decodable
extension ResponseEntity: Decodable {
    public static func decode(e: Extractor) throws -> ResponseEntity {
        return try build(ResponseEntity.init)(
            e <| "totalHits",
            e <|| "hits"
        )
    }
}