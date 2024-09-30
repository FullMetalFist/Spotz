//
//  ContentView.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("3rd Ave Playground")
                    .font(.title)
                HStack {
                    Text("Francis Lewis Park")
                        
                    Spacer()
                    Text("New York")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About Francis Lewis Park")
                Text("Descriptive Lorem Ipsum")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
