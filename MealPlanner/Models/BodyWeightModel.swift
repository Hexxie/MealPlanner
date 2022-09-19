//
//  BodyWeightModel.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import Foundation

struct BodyWeight: Identifiable {
    let id = UUID()
    var weight: Double
}

extension BodyWeight {
    static let fill = BodyWeight(weight: 50.3)
}
