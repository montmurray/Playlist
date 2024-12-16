//
//  ContentView.swift
//  Playlist
//
//  Created by Tessa Murray on 12/3/24.
//


import SwiftUI

struct ContentView: View {
    @State private var index = 0
    @State private var albums = "Default"
    @State private var artists = "Artist Name"
    @State private var tracks = "Track Name"
    //album list array, base for the program.
    @State private var songList = [
        ("Placeholder 1", "song1"), ("Placeholder 2", "song2"), ("Placeholder 3", "song3")
    ]
    @State private var playing = false
    @State private var looping = false
    var body: some View {
        ZStack {
            Rectangle() //background
                .fill(LinearGradient(colors: background() //color function
                                     , startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea(.all)
            VStack {
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
                    }
                    Button(action: { previous()
                    }) {
                        Image("Previous")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    //Play and Pause, using sound modifier to play song names.
                    Button(action: { play()
                    }) {
                        if playing == false {
                            Image("Play")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                            
                        } else {
                            Image("Pause")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                    }
                    Button(action: { skip()
                    }) {
                        Image("Skip")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {
                    }) {
                        Image("Loop")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
        //setting button functions
        func update() {
            //switch variables, uses case statements to update the song and strings attached currently displayed.
            switch albums {
            case "Placeholder 1":
                artists = "The Smashing Pumpkins"
                tracks = "Bullet with Butterfly Wings"
            case "Placeholder 2":
                artists = "Depeche Mode"
                tracks = "Enjoy the Silence"
            case "Placeholder 3":
                artists = "New Order"
                tracks = "True Faith"
            default:
                artists = "Artist Name"
                tracks = "Track Name"
            }
        }
        //play, utilizing the boolean toggle function.
        func play() {
            albums = songList[index].0
            update()
            playing.toggle()
        }
        //shuffle, utilizing the shuffle functions
        func shuffle() {
            songList.shuffle()
            albums = songList[index].0
            update()
        }
        // skip
        func skip() {
            index += 1
            if index > 2 { //change this when all songs are added.
                index = 0
            }
            albums = songList[index].0
            play()
            update()
        }
        //previous, same as above.
        func previous() {
            index -= 1
            if index > 2 || index < 0 { //change this when all songs are added.
                index = 0
            }
            albums = songList[index].0
            update()
            play()
            update()
        }
        //looping, toggle function, will revise when audio is added.
        func loop() {
            looping.toggle()
        }
        func background() -> [Color] { //changes background color, made with AI/Youtube assistance.
            if albums == "Placeholder 1"{
                return [.indigo, .black]
            } else if albums == "Placeholder 2"{
                return [.red, .black]
            } else if albums == "Placeholder 3"{
                return [.white, .black]
            } else {
                return [.gray, .black]
            }
        }
    }
    #Preview {
        ContentView()
    }
