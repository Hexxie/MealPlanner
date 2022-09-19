//
//  RingProgress.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

struct RingProgress: View {
    
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
            }
            .animation(Animation.easeIn(duration: 1))
            .padding(lineWidth / 2)
        }
    }
}

struct RingProgress_Previews: PreviewProvider {
    
    static var previews: some View {
        RingProgress(lineWidth: 50, backgroundColor: .blue.opacity(0.2), foregroundColor: .blue, percentage: 100)
    }
}
