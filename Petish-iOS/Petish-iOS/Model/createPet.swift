import Foundation
import UIKit

struct PetData{
    var image: UIImage?
    var name: String
    var species: String
    var birthday: String
    var primaryBreed: String
    var weight: String
    var dimensions: PetDimensions
    
    init(){
        self.image = nil
        self.name = ""
        self.species = ""
        self.birthday = ""
        self.primaryBreed = ""
        self.weight = ""
        self.dimensions = PetDimensions()
    }
}

struct PetDimensions{
    var neck: String
    var chest: String
    var back: String
    
    init(){
        self.neck = ""
        self.chest = ""
        self.back = ""
    }
}
