////
////  CollectionView.swift
////  Mindoro Application
////
////  Created by Nithya Setlur on 2/5/2024.
////
//
//import SwiftUI
//
//struct Minion {
//    let name: String
//    let image: Image
//    let cost: Int
//}
//
//struct MinionView: View {
//    let minion: Minion
//
//    var body: some View {
//        VStack {
//            minion.image
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.white)
//        .border(Color.black, width: 1)
//    }
//}
//
//struct MinionShopView: View {
//    @State private var purchasedMinions: Set<Int> = []
//
//    let minions: [Minion] = [
//        Minion(name: "Bobo", image: Image("bobo"), cost: 50),
//        Minion(name: "Goggles", image: Image("goggles"), cost: 50),
//        Minion(name: "Zippy", image: Image("zippy"), cost: 100),
//        Minion(name: "Rocky", image: Image("rocky"), cost: 150),
//        Minion(name: "Spike", image: Image("spike"), cost: 150),
//    ]
//
//    var body: some View {
//        NavigationView {
//            ZStack(alignment: .topTrailing) {
//                VStack {
//                    Text("Minion Family")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                        .padding(.top, 40)
//                    Text("View your Minion Family here!")
//                        .font(.headline)
//                        .frame(width: 380, height: 100)
//                        .padding(.bottom, 0)
//                        .multilineTextAlignment(.center)
//                    ScrollView {
//                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 10) {
//                            ForEach(minions.indices.filter { !purchasedMinions.contains(minions[$0].name.hashValue) }, id: \.self) { index in
//                                MinionView(minion: minions[index])
//                                    .aspectRatio(1, contentMode: .fit)
//                            }
//                        }
//                        .padding()
//                    }
//                    Spacer()
//                }
//            }
//            .navigationBarItems(trailing: EmptyView())
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MinionShopView()
//    }
//}
//
