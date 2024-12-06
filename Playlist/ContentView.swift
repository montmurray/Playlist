//
//  ContentView.swift
//  Playlist
//
//  Created by Tessa Murray on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue = 0
    var body: some View {
        VStack {
            Image("Default")
                .resizable()
                .frame(width: 300, height: 300)
                .padding()
            Text("Track Name")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .bold()
            Text("Artist Name")
                .font(.title)
            
            
        }
        Spacer()
        // bar
        // buttons
        HStack{
            Image("Shuffle")
                .resizable()
                .frame(width: 25, height: 30)
                .padding()
                .onTapGesture {
                    randomSong(times: 1)
                }
            Image("Previous")
                .resizable()
                .frame(width: 50, height: 50)
            // button function
            Image("Play")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
            // button function
            Image("Skip")
                .resizable()
                .frame(width: 50, height: 50)
            Image("Loop")
                .resizable()
                .frame(width: 25, height: 30)
                .padding()
        }
        Spacer()
        // audio
        
    }
    func randomSong(times: Int){
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                randomSong(times: times - 1)
            }
        }
    }
}
        #Preview {
            ContentView()
        }
