//
//  DailyCard.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 30.08.2022.
//

import SwiftUI

struct DailyCard: View {
    
    var nutritionManager: NutritionManager
    
    @State private var comment = "Tell me about your day..."
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: UIScreen.screenWidth, height: 560, alignment: .center)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 3)
            
            VStack {
                HStack{
                    RingChart(weeklyWeight: nutritionManager.weight, ringSize: UIScreen.screenWidth * 0.25, lineWidth: 7)
                    NutrientsView(weeklyNutrients: nutritionManager.dailyNutrition())
                }.padding()
                Text("Breakfast:")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                NutrientsView(weeklyNutrients: nutritionManager.breakfastNutrition())
                Text("Lunch:")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                NutrientsView(weeklyNutrients: nutritionManager.breakfastNutrition())
                Text("Dinner:")
                    .foregroundColor(Color.NutrientTextColor)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                NutrientsView(weeklyNutrients: nutritionManager.breakfastNutrition())

                TextEditor(text: $comment)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

/*
struct DailyCard_Previews: PreviewProvider {
    static var previews: some View {
        DailyCard(dailyWeight: 50.1, dailyNutrients: Nutrition.fill)
    }
}*/
