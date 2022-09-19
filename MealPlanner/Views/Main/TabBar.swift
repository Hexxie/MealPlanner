//
//  TabBar.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

struct TabBar: View {
    @State private var selection = 3
    
    var body: some View {
        TabView (selection:$selection) {
            WeighView()
                .tabItem {
                    Label("Weight", systemImage: "fork.knife")
                }
                .tag(1)
            
            RecipiesView()
                .tabItem {
                    Label("Recipies", systemImage: "list.bullet.below.rectangle")
                }
                .tag(2)
            
            DailyView()
                .tabItem {
                    Label("Daily", systemImage: "house")
                }
                .tag(3)
            
            StaticticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar")
                }
                .tag(4)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "ellipsis")
                }
                .tag(5)
        }
        .accentColor(.orange)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
