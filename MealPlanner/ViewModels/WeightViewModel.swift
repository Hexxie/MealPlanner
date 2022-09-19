//
//  WeightViewModel.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import Foundation
import HealthKit

class WeightManager: ObservableObject {

    @Published var bodyWeight: BodyWeight = BodyWeight(weight: 51)
    private var healthStore: HealthStore?
    
    init() {
        healthStore = HealthStore()
    }
    
    func requestHealthKit()
    {
        if let healthStore = healthStore {
            healthStore.requestAuthorization {success in
                if success {
                    healthStore.fetchWeightData { statisticsCollection in
                        if let weighItem = statisticsCollection.last {
                            print(weighItem.quantity.doubleValue(for: .gram()))
                            //TODO: WHATS THIS????
                            DispatchQueue.main.async {
                                self.bodyWeight.weight = weighItem.quantity.doubleValue(for: .gram()) / 1000
                            }
                        }
                    }
                }
            }
        }
    }
}


struct NutritionManager {
    var weight: Double
    
    var dailyCalories: Double {
        get {
            return weight * 27 * 0.9
        }
    }
    
    var dailyProteins: Double {
        get {
            return weight * 1.2
        }
    }
    
    var dailyFats: Double
    {
        get {
            return weight
        }
    }
    
    var dailyCarbs: Double
    {
        get {
            let prots_gr = self.dailyProteins * 4
            let fats_gr = self.dailyFats * 9
            
            return (self.dailyCalories - prots_gr - fats_gr) / 4
        }
    }
    
    func weekly(value: Double) -> Double
    {
        return value * 7
    }
    
    func meal(value: Double) -> Double
    {
        return value / 3
    }
    
    func weeklyNutrition() -> Nutrition
    {
        return Nutrition(
            calories: weekly(value: dailyCalories),
            proteins: weekly(value: dailyProteins),
            fats: weekly(value: dailyFats),
            carbs: weekly(value: dailyCarbs))
    }
    
    func dailyNutrition() -> Nutrition
    {
        return Nutrition(
            calories: dailyCalories,
            proteins: dailyProteins,
            fats: dailyFats,
            carbs: dailyCarbs)
    }
    
    func breakfastNutrition() -> Nutrition
    {
        return Nutrition(
            calories: meal(value: dailyCalories),
            proteins: meal(value: dailyProteins),
            fats: meal(value: dailyFats),
            carbs: meal(value: dailyCarbs))
    }
}

class HealthStore {
    var healthStore: HKHealthStore?
    var query: HKSampleQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    public func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let weightType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        
        guard let healthStore = self.healthStore else {return completion(false)}
        
        healthStore.requestAuthorization(toShare: [], read: [weightType]) { (success, error) in
            completion(success)
        }
    }
    
    func fetchWeightData(completion: @escaping ([HKQuantitySample]) -> Void) {
        print("Fetching weight data")
        
        let weightType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)
        
        query = HKSampleQuery(sampleType: weightType!, predicate: nil, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) { query, results, error in
            
            guard let samples = results as? [HKQuantitySample] else {
                    // Handle any errors here.
                    return
                }
            
            completion(samples)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
}
