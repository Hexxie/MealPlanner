//
//  NutritionModel.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import Foundation

struct Nutrition: Identifiable {
    let id = UUID()
    var calories: Double
    var proteins: Double
    var fats: Double
    var carbs: Double
}

extension Nutrition {
    static let fill = Nutrition(calories: 7000, proteins: 300, fats: 200, carbs: 100)
}
