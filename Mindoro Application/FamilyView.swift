//
//  FamilyView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 1/5/2024.
//

import SwiftUI

struct MinionFamily: View {
    var body: some View {
        VStack{
            Text("Meet your hard earned minion family!")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)
            Text("Click on your profile to check out your companions")
                .font(.title3)
                .multilineTextAlignment(.center)
            Text("They grow bigger every week you complete your goals.")
                .font(.title3)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            ZStack{
                Image("family")
                    .resizable()
                    .frame(width: 400, height: 400)
                Circle()
                    .frame(width: 103, height: 103)
                    .position(CGPoint(x: 194.0, y: 179.0))
                    .foregroundColor(.gray)
            }
        }
    }
}
#Preview {
    MinionFamily()
}
