//
//  ContentView.swift
//  DancingPeople
//
//  Created by Cem Aksoy on 13.11.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var dancingPerson = Image("dancingPerson1")
    var body: some View {
        ZStack {
          Color.indigo.opacity(0.45).ignoresSafeArea()
          
          VStack {
            Spacer()
            Text("Ready to dance?")
              .font(.largeTitle)
              .fontWeight(.medium)
              .foregroundStyle(.white.opacity(0.9))
            //TODO: onAppear, jumping the letters on y-axis independent from each other with each having delay, til the dancing person is tapped. After it is tapped, text is hidden with animation.
            
            Spacer()
            
              dancingPerson
              .resizable()
              .scaledToFit()
            
            Spacer()
            Spacer()
            
            
            Button {
              //TODO: Pick a photo
            } label: {
              Label("Pick Photo", systemImage: "photo.fill.on.rectangle.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.appPurple)
            .shadow(radius: 4)
           
            Rectangle().frame(height: 0)

          }
        }
        
        
    }
}

#Preview {
    ContentView()
}
