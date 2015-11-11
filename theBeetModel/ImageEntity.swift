import Himotoki

public struct ImageEntity {
    public let id: UInt64
    
    public let pageURL: String
    public let pageImageWidth: Int
    public let pageImageHeight: Int
    
    public let previewURL: String
    public let previewWidth: Int
    public let previewHeight: Int
    
    public let imageURL: String
    public let imageWidth: Int
    public let imageHeight: Int
    
    public let viewCount: Int64
    public let downloadCount: Int64
    public let likeCount: Int64
    public let tags: [String]
    public let username: String
}

// MARK: Decodable
extension ImageEntity: Decodable {
    public static func decode(e: Extractor) throws -> ImageEntity {
        let splitCSV: String -> [String] = { csv in
            csv.characters
                .split { $0 == "," }
                .map {
                    String($0).stringByTrimmingCharactersInSet(
                        NSCharacterSet.whitespaceCharacterSet())
            }
        }
        
        return try build(ImageEntity.init)(
            e <| "id",
            
            e <| "pageURL",
            e <| "imageWidth",
            e <| "imageHeight",
            
            e <| "previewURL",
            e <| "previewWidth",
            e <| "previewHeight",
            
            e <| "webformatURL",
            e <| "webformatWidth",
            e <| "webformatHeight",
            
            e <| "views",
            e <| "downloads",
            e <| "likes",
            (try? e <| "tags").map(splitCSV) ?? [],
            e <| "user"
        )
    }
}