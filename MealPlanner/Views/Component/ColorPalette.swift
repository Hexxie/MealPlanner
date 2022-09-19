//
//  ColorPalette.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width - 10
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Color {
    public static var ProteinsColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 0.71, green: 0.82, blue: 1.00)
    }
    
    public static var FatsColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 1.00, green: 0.87, blue: 0.71)
    }
    
    public static var CarbsColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 1.00, green: 0.79, blue: 0.71)
    }
    
    public static var MainColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 0.99, green: 0.99, blue: 0.99)
    }
    
    public static var TextColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 0.44, green: 0.44, blue: 0.44)
    }
    
    public static var NutrientTextColor: Color {
        return Color(Color.RGBColorSpace.sRGB, red: 0.66, green: 0.65, blue: 0.65)
    }
}
