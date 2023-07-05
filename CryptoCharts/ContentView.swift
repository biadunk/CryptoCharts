//
//  ContentView.swift
//  CryptoCharts
//
//  Created by Kacper Biaduń on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
     
    @State private var isPresented: Bool  = false
    @ObservedObject var model = Model()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(String(model.response?.rate ?? 0.0))")
            
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Check charts")
                    Image(systemName: "chart.bar")
                }

            }
            .onAppear {
                Task {
                    do {
                        try await model.fetchSingleExchange(crypto: .ETH, currency: .USD)
                    } catch {
                        print(error)
                        assertionFailure("FATAL ERROR")
                    }
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

class Model: ObservableObject {
    var baseUrl: String = "http://rest.coinapi.io/"
    var apiKey = "APIKEY-EE3C07FA-8B6B-434F-9F77-C07EB6C4B571/"
    var exchangeRatesRoute = "v1/exchangerate/"
    
    @Published var response: ExchangeResponse?
    
    func fetchSingleExchange(crypto: Crypto, currency: Currency) async throws {
        let fullPath = "\(baseUrl)\(exchangeRatesRoute)\(crypto)/\(currency)/\(apiKey)"
        let url = URL(string: fullPath)!
        let (data, _) = try await URLSession.shared.data(from: url)
        response = try JSONDecoder().decode(ExchangeResponse.self, from: data)
    }
}

struct ExchangeResponse: Codable {
    let time, asset_id_base, asset_id_quote: String
    let rate: Double
}


enum Crypto: String {
    case BTC
    case ETH
}
enum Currency: String {
    case USD
}
