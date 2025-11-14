//
//  ContentView.swift
//  DancingPeople
//
//  Created by Cem Aksoy on 13.11.2025.
//

import SwiftUI
import AVFAudio
import PhotosUI

struct ContentView: View {
  @State private var dancingPerson = Image("dancingPerson1")
  @State private var isFullSize = true
  @State private var audioPlayer: AVAudioPlayer!
  @State private var pickerItem: PhotosPickerItem?
  
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
            
            PhotosPicker(selection: $pickerItem, matching: .images, preferredItemEncoding: .automatic) {
              Label("Pick Photo", systemImage: "")
            }
              .onChange(of: pickerItem) {
                Task {
                  guard let selectedImage = try? await pickerItem?.loadTransferable(type: Image.self) else{
                    print("😡 ERROR 😡")
                    return
                  }
                  dancingPerson = selectedImage
                }
              }
           
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
