//
//  NutrientsView.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 30.08.2022.
//

import SwiftUI

struct NutrientsView: View {
    var weeklyNutrients: Nutrition
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Calories")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.7 * 0.3, height: 10, alignment: .center)
                Text("Proteins")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.65 * 0.3, height: 10, alignment: .center)
                Text("Fats")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.5 * 0.2, height: 10, alignment: .center)
                Text("Carbs")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.7 * 0.2, height: 10, alignment: .center)
            }
            HStack {
                Text("\(weeklyNutrients.calories, specifier: "%.0f")")
                    .foregroundColor(Color.TextColor)
                    .frame(width: UIScreen.screenWidth * 0.7 * 0.3, height: 10, alignment: .center)
                Text("\(weeklyNutrients.proteins, specifier: "%.0f")")
                    .foregroundColor(Color.TextColor)
                    .frame(width: UIScreen.screenWidth * 0.65 * 0.3, height: 10, alignment: .center)
                Text("\(weeklyNutrients.fats, specifier: "%.0f")")
                    .foregroundColor(Color.TextColor)
                    .frame(width: UIScreen.screenWidth * 0.5 * 0.2, height: 10, alignment: .center)
                Text("\(weeklyNutrients.carbs, specifier: "%.0f")")
                    .foregroundColor(Color.TextColor)
                    .frame(width: UIScreen.screenWidth * 0.7 * 0.2, height: 10, alignment: .center)
                
            }
        }
    }
}

struct NutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientsView(weeklyNutrients: Nutrition.fill)
    }
}
