//
//  ContentView.swift
//  CryptoCharts
//
//  Created by Kacper Biaduń on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    ChooseChartsView()
                } label: {
                    Text("Check charts")
                    Image(systemName: "chart.bar")
                }

            }
            .navigationTitle("Crypto Courses")
            .padding()
            .background(Color(.brown))
            .cornerRadius(20)
            .accentColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
