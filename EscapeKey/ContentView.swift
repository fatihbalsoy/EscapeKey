//
//  ContentView.swift
//  EscapeKey
//
//  Created by Fatih Balsoy on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button("Escape") {
                EscapeKey.simulate()
            }.colorInvert()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
