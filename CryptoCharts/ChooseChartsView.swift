//
//  ChooseChartsView.swift
//  CryptoCharts
//
//  Created by Kacper Biaduń on 12/06/2023.
//

import SwiftUI
import Charts

public struct chartsOfCrypto: Identifiable {
    public let id = UUID()
    let name: String
    let value: Int
}

private var cryptos: [chartsOfCrypto] = [
    chartsOfCrypto(name: "Bitcoin", value: 100000),
    chartsOfCrypto(name: "Ethereum", value: 23000),
    chartsOfCrypto(name: "Cronos", value: 2000),
    chartsOfCrypto(name: "Polygon", value: 90022)
]

struct ChooseChartsView: View {
    var body: some View {
        NavigationView {
            VStack{
                Chart{
                    ForEach(cryptos) { crypto in
                        BarMark(x: .value("Name", crypto.name), y: .value("Course", crypto.value))
                    }
                }
                .frame(height: 140)
            }
        }
    }
}

struct ChooseChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseChartsView()
    }
}
