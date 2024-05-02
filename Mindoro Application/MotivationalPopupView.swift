//
//  MotivationalPopupView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct MotivationalPopupView: View {
    @State private var showQuote = false
    @State private var randomQuote: String = ""

    let quotes: [String] = [
        "As long as you keep going, you'll keep getting better. And as you get better, you gain more confidence. That alone is success.",
        "Success is the sum of small efforts, repeated day in and day out. - Robert Collier",
        "The secret of getting ahead is getting started. - Mark Twain",
        "Motivation is what gets you started. Habit is what keeps you going. - Jim Ryun",
        "Every accomplishment starts with the decision to try. - John F. Kennedy",
        "The only way to do great work is to love what you do. - Steve Jobs",
        "The difference between who you are and who you want to be is what you do. - Unknown",
        "Small disciplines repeated with consistency every day lead to great achievements gained slowly over time. - John C. Maxwell",
        "The journey of a thousand miles begins with one step. - Lao Tzu",
        "You don't have to be great to start, but you have to start to be great. - Zig Ziglar",
        "Success is not the result of spontaneous combustion. You must set yourself on fire. - Arnold H. Glasow",
        "The only bad workout is the one that didn't happen. - Unknown",
        "Your body can do anything. It's your brain you have to convince. - Unknown",
        "The only way to define your limits is by going beyond them. - Arthur Clarke",
        "Don't stop when you're tired, stop when you're done. - Unknown",
        "The difference between try and triumph is just a little umph! - Marvin Phillips",
        "Believe you can and you're halfway there. - Theodore Roosevelt",
        "Strength doesn't come from what you can do. It comes from overcoming the things you once thought you couldn't. - Rikki Rogers",
        "Strive for progress, not perfection. - Unknown",
        "The only way to do great work is to love what you do. - Steve Jobs",
        "Don't watch the clock; do what it does. Keep going."
    ]

    var body: some View {
        VStack {
            Button("Show Random Quote") {
                let randomIndex = Int.random(in: 0..<quotes.count)
                randomQuote = quotes[randomIndex]
                showQuote = true
            }
        }
        .alert(isPresented: $showQuote) {
            Alert(
                title: Text("Motivational Quote"),
                message: Text(randomQuote),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct MotivationalPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationalPopupView()
    }
}
