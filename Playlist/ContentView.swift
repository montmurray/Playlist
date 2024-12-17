//
//  ContentView.swift
//  Playlist
//
//  Created by Tessa Murray on 12/3/24.
//

// notes to self: add more tracks, add actual music.

import SwiftUI
import AVFoundation //for audio

struct ContentView: View {
    @State private var index = 0
    @State private var albums = "Default"
    @State private var artists = "Artist Name"
    @State private var tracks = "Track Name"
    //album list array, base for the program.
    @State private var songList = [
        ("Melon Collie", "bwbw"), ("Violator", "enjoy the silence"), ("Substance", "true faith"), ("The Head on the Door", "inbetweendays"), ("Unknown Pleasures", "shadowplay"), ("Bleach", "mrmoustache"), ("VOCA COLLECTION", "aimaielegy"), ("Demon Days", "kidswguns")
    ]
    @State private var playing = false
    @State private var looping = false
    // audio player, via youtube assistance
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        ZStack {
            Rectangle() //background
                .fill(LinearGradient(colors: background() //color function
                                     , startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea(.all)
            VStack {
                Spacer(minLength: 0)
                Image(albums)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding()
                Text(tracks)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(5)
                    .foregroundStyle(.white)
                Text(artists)
                    .font(.title)
                    .foregroundStyle(.white)
                
                // bar, slider function.
                
                // buttons
                HStack{
                    Button(action: { shuffle()
                    }) {
                        Image("Shuffle")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .padding()
                            .colorInvert()
                    }
                    Button(action: { previous()
                    }) {
                        Image("Previous")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .colorInvert()
                    }
                    //Play and Pause, using sound modifier to play song names.
                    Button(action: { play()
                    }) {
                        if playing == false {
                            Image("Play")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                                .colorInvert()
                            
                        } else {
                            Image("Pause")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                                .colorInvert()
                        }
                    }
                    Button(action: { skip()
                    }) {
                        Image("Skip")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .colorInvert()
                    }
                    Button(action: {
                    }) {
                        Image("Loop")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .padding()
                            .colorInvert()
                    }
                }
                Spacer(minLength: 2)
                Spacer(minLength: 2)
            }
        }
        .onAppear{
            playAudio()
        }
    }
    //setting button functions
    func update() {
        //switch variables, uses case statements to update the song and strings attached currently displayed.
        switch albums {
        case "Melon Collie":
            artists = "The Smashing Pumpkins"
            tracks = "Bullet with Butterfly Wings"
        case "Violator":
            artists = "Depeche Mode"
            tracks = "Enjoy the Silence"
        case "Substance":
            artists = "New Order"
            tracks = "True Faith"
        case "Unknown Pleasures":
            artists = "Joy Division"
            tracks = "Shadowplay"
        case "Bleach":
            artists = "Nirvana"
            tracks = "Mr. Moustache"
        case "VOCA COLLECTION":
            artists = "DECO*27"
            tracks = "Love-Lost Elegy (ft. Hatsune Miku)"
        case "Demon Days":
            artists = "Kids with Guns"
            tracks = "Gorillaz"
        case "The Head on the Door":
            artists = "The Cure"
            tracks = "In Between Days"
        default:
            artists = "Artist Name"
            tracks = "Track Name"
        }
    }
    func playAudio(){ // found via stack overflow, youtube, hacking with swift, and ai assistance
        let audio = songList[index].1
        if let url = Bundle.main.url(forResource: audio, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error")
            }
        }
    }
    //play, utilizing the boolean toggle function.
    func play() {
        albums = songList[index].0
        update()
        if playing {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
        playing.toggle()
    }
    //shuffle, utilizing the shuffle functions
    func shuffle() {
        songList.shuffle()
        index = 0
        albums = songList[index].0
        update()
        audioPlayer?.stop()
        audioPlayer = nil
        playAudio()
        playing.toggle()
    }
    // skip
    func skip() {
        index += 1
        if index > songList.count { //change this when all songs are added.
            index = 0
        }
        albums = songList[index].0
        play()
        update()
        playAudio()
    }
    //previous, same as above.
    func previous() {
        index -= 1
        if index > songList.count || index < 0 { //change this when all songs are added.
            index = 0
        }
        albums = songList[index].0
        update()
        play()
        update()
        playAudio()
    }
    //looping, toggle function, will revise when audio is added.
    func loop() {
        looping.toggle()
    }
    func background() -> [Color] { //changes background color, made with AI/Youtube assistance.
        if albums == "Melon Collie"{
            return [.indigo, .black]
        } else if albums == "Violator" || albums == "VOCA COLLECTION" {
            return [.red, .black]
        } else if albums == "Substance" {
            return [.white, .black]
        } else if albums == "The Head on the Door"{
                return [.blue, .black]
        } else if albums == "Demon Days"{
                return [.purple, .black]
        } else {
            return [.gray, .black]
        }
    }
}
#Preview {
    ContentView()
}
