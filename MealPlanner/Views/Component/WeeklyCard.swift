//
//  WeeklyCard.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

struct WeeklyCard: View {
    var nutritionManager: NutritionManager
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: UIScreen.screenWidth, height: 160, alignment: .center)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 3)
            
            
            HStack{
                RingChart(weeklyWeight: nutritionManager.weight, ringSize: UIScreen.screenWidth * 0.25, lineWidth: 7)
                
                NutrientsView(weeklyNutrients: nutritionManager.weeklyNutrition())
            }
        }
    }
}

/*
struct WeeklyCard_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCard(nutritionManager: NutritionManager(weight: 50.1), weight: 50)
    }
}*/
