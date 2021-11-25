import Foundation
import UIKit

struct PetData{
    var image: UIImage?
    var name: String
    var species: String
    var birthday: String
    var primaryBreed: String
    var weight: Int
    var dimensions: PetDimensions?
    
    init(){
        self.image = nil
        self.name = ""
        self.species = ""
        self.birthday = ""
        self.primaryBreed = ""
        self.weight = 0
        self.dimensions = nil
    }
}

struct PetDimensions{
    let neck: Int
    let chest: Int
    let back: Int
}

struct PetImageDetails{
    let image: UIImage
    let url: NSURL
    
    init(image: UIImage, url: NSURL){
        self.image = image
        self.url = url
    }
}
