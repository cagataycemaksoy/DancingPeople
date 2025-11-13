//
//  ContentView.swift
//  DancingPeople
//
//  Created by Cem Aksoy on 13.11.2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var dancingPerson = Image("dancingPerson1")
  @State private var isFullSize = true
  @State private var audioPlayer: AVAudioPlayer!
  
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
              .scaleEffect(isFullSize ? 1.0 : 0.8)
              .onTapGesture {
                playAudio()
                isFullSize = false
                withAnimation(.spring(response: 0.4, dampingFraction: 0.45)) {
                  isFullSize = true
                }
              }
            
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
  
  func playAudio() {
    if audioPlayer != nil && audioPlayer.isPlaying {
      audioPlayer.stop()
    }
    
    guard let audioData = NSDataAsset(name: "kick") else {
      fatalError("Failed to find the file.")
    }
    
    do {
      audioPlayer = try AVAudioPlayer(data: audioData.data)
      audioPlayer.play()
    } catch {
      fatalError("Failed to load the audio file contents.")
    }
  }
}

#Preview {
    ContentView()
}
