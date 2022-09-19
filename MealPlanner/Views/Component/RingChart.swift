//
//  RingChart.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

struct RingChart: View {
    
    var weeklyWeight: Double
    var ringSize: CGFloat
    var lineWidth: CGFloat
    
    @State var percentage1: Double = 0
    @State var percentage2: Double = 0
    @State var percentage3: Double = 0
    
    var body: some View {
        ZStack{
            RingProgress(
                lineWidth: lineWidth,
                backgroundColor: Color.ProteinsColor.opacity(0.2),
                foregroundColor: Color.ProteinsColor,
                percentage: percentage1)
                    .frame(width: ringSize - lineWidth*4, height: ringSize - lineWidth*4)
                    .onAppear {
                    self.percentage1 = 70
                    }
            RingProgress(
                lineWidth: lineWidth,
                backgroundColor: Color.FatsColor.opacity(0.2),
                foregroundColor: Color.FatsColor,
                percentage: percentage2)
                    .frame(width: ringSize - lineWidth*2, height: ringSize - lineWidth*2)
                    .onAppear {
                    self.percentage2 = 50
                    }
            RingProgress(
                lineWidth: lineWidth,
                backgroundColor: Color.CarbsColor.opacity(0.2),
                foregroundColor: Color.CarbsColor,
                percentage: percentage3)
                    .frame(width: ringSize, height: ringSize)
                    .onAppear {
                    self.percentage3 = 80
                    }
            Text("\(weeklyWeight, specifier: "%.1f") kg")
                .font(.system(size: lineWidth * 1.5))
                .fontWeight(.bold)
                .foregroundColor(Color.TextColor)
        }
    }
}

struct RingChart_Previews: PreviewProvider {
    static var previews: some View {
        RingChart(weeklyWeight: 50.1, ringSize: 300, lineWidth: 20)
    }
}
