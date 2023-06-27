//
//  ContentView.swift
//  CryptoCharts
//
//  Created by Kacper Biaduń on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
     
    @State private var isPresented: Bool  = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Check charts")
                    Image(systemName: "chart.bar")
                }

            }
            .sheet(isPresented: $isPresented, content: {
                ChooseChartsView()
            })
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
