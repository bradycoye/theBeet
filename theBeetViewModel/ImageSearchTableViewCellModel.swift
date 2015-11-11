import theBeetModel

public final class ImageSearchTableViewCellModel: ImageSearchTableViewCellModeling {
    public let id: UInt64
    public let pageImageSizeText: String
    public let tagText: String
    
    internal init(image: ImageEntity) {
        id = image.id
        pageImageSizeText = "\(image.pageImageWidth) x \(image.pageImageHeight)"
        tagText = image.tags.joinWithSeparator(", ")
    }
}