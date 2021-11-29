import Foundation
import UIKit


struct OnboardingData{
    
    let image: UIImage
    let descriptionTexts: String
    let subtitleTexts: String
    
    init(image: UIImage, descriptionTexts: String, subtitleTexts: String){
        self.image = image
        self.descriptionTexts = descriptionTexts
        self.subtitleTexts = subtitleTexts
    }
}

// READ-ONLY for onboarding screen
let onboardingData: [OnboardingData] = [
    OnboardingData(image: #imageLiteral(resourceName: "Rectangle 2.2"), descriptionTexts: "Personalized Fit", subtitleTexts: "Create a personalised profile for your pet to ensure the perfect fit"),
    OnboardingData(image: #imageLiteral(resourceName: "Rectangle 2.2-2"), descriptionTexts: "Discover", subtitleTexts: "Discover new favorites! The world’s leading pet brands in one place.  "),
    OnboardingData(image: #imageLiteral(resourceName: "Rectangle 2.2-1"), descriptionTexts: "Review", subtitleTexts: "Customers review our products, so you know exactly what you are getting!")
]
