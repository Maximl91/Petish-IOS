import Foundation
import UIKit

struct PetDimensions{
    let neck: Int
    let chest: Int
    let back: Int
}

struct PetData{
    let image: UIImage
    let name: String
    let species: String
    let birthday: String
    let primaryBreed: String
    let weight: Int
    let dimensions: PetDimensions
}

struct PetImageDetails{
    let image: UIImage
    let url: NSURL
    
    init(image: UIImage, url: NSURL){
        self.image = image
        self.url = url
    }
}
