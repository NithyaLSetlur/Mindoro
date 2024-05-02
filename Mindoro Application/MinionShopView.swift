//
//  MinionShopView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 2/5/2024.
//

import SwiftUI

struct Minion {
    let name: String
    let image: Image
    let cost: Int
}

struct MinionView: View {
    let minion: Minion
    @Binding var points: Int
    @Binding var showError: Bool // New binding for error message
    var action: () -> Void // Action to perform when minion is bought
    @Binding var purchasedMinions: Set<Int> // Binding to the purchased minions

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(minion.name)
                .font(.title)
                .lineLimit(1)
                .minimumScaleFactor(0.9)
                .padding()
            minion.image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("\(minion.cost) 🍌")
                .foregroundColor(.black)
            Button(action: {
                if points >= minion.cost {
                    points -= minion.cost
                    action() // Perform action (remove minion from list)
                    purchasedMinions.insert(minion.name.hashValue) // Mark minion as purchased
                } else {
                    showError = true // Show error message
                }
            }) {
                Text("Buy")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
        }
        .padding()
        .background(Color.white)
        .border(Color.black, width: 1)
    }
}

struct MinionShopView: View {
    @State private var points = 0
    @State private var showError = false
    @State private var purchasedMinions: Set<Int> = []

    let minions: [Minion] = [
        Minion(name: "Bobo", image: Image("bobo"), cost: 50),
        Minion(name: "Goggles", image: Image("goggles"), cost: 50),
        Minion(name: "Zippy", image: Image("zippy"), cost: 100),
        Minion(name: "Rocky", image: Image("rocky"), cost: 150),
        Minion(name: "Spike", image: Image("spike"), cost: 150),
        Minion(name: "Snockers", image: Image("snockers"), cost: 200),
        Minion(name: "Luna", image: Image("luna"), cost: 200),
        Minion(name: "Whiskers", image: Image("whiskers"), cost: 200),
        Minion(name: "Sparkle", image: Image("sparkles"), cost: 250),
        Minion(name: "Bubbles", image: Image("bubbles"), cost: 300),
    ]

    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                VStack {
                    Text("Minion Store")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Text("Use your points to buy more minions and enlarge your Minion Family!")
                        .font(.headline)
                        .frame(width: 380, height: 100)
                        .padding(.bottom, 0)
                        .multilineTextAlignment(.center)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 10) {
                            ForEach(minions.indices.filter { !purchasedMinions.contains(minions[$0].name.hashValue) }, id: \.self) { index in
                                MinionView(minion: minions[index], points: $points, showError: $showError, action: {
                                    purchasedMinions.insert(minions[index].name.hashValue) // Mark minion as purchased
                                }, purchasedMinions: $purchasedMinions)
                                .aspectRatio(1, contentMode: .fit)
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
                Text("🍌: \(points)")
                    .padding()
            }
            .navigationBarItems(trailing: EmptyView())
            .navigationBarHidden(true)
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Not Enough Points"),
                message: Text("Sorry, you don't have enough points. Work harder to earn more points!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct MinionCollectionView: View {
    let purchasedMinions: Set<Int>
    let minions: [Minion]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(purchasedMinions.sorted(), id: \.self) { hashValue in
                    if let minion = minions.first(where: { $0.name.hashValue == hashValue }) {
                        HStack {
                            minion.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(minion.name)
                                .font(.headline)
                        }
                        .padding()
                        .background(Color.white)
                        .border(Color.black, width: 1)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MinionShopView()
    }
}
