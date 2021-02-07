//
//  ContentView.swift
//  Fructus
//
//  Created by Alejandro Maguey Renteria on 05/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    var body: some View {
        NavigationView{
            List(fruits) {item in
                NavigationLink(destination: FruitDetailView(fruit: item)) {
                    FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                }
                
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                    isShowingSettings = true
            }) {
                Image(systemName: "slider.horizontal.3")
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
            )
        } // Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
