//
//  DailyView.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI
import HealthKit

struct DailyView: View {
    @ObservedObject private var weightManager = WeightManager()
    @State private var nutritionManager: NutritionManager?
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    WeeklyCard(nutritionManager: NutritionManager(weight: weightManager.bodyWeight.weight))
                    Text("Daily Goal")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    DailyCard(nutritionManager: NutritionManager(weight: weightManager.bodyWeight.weight))
                }
            }
            
            .navigationTitle("Weekly Goal")
            .background(Color.MainColor)
            .onAppear(perform: weightManager.requestHealthKit)
        }
        .navigationViewStyle(.stack)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
