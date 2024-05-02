//
//  MinionFamilyView.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 2/5/2024.
//

import SwiftUI

struct MinionFamilyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Meet your hard-earned minion family!")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.center)
                Text("Click on your profile to check out your companions!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                Text("They grow bigger every week you complete your goals.")
                    .font(.title3)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: MinionShopView()) {
                    ZStack {
                        Image("family")
                            .resizable()
                            .frame(width: 400, height: 400)
                        NavigationLink{
                            CollectionView1()
                        } label: {
                            Circle()
                                .frame(width: 103, height: 103)
                                .foregroundColor(.black)
                                .position(CGPoint(x: 194.0, y: 179.0))
                        }
                    }
                }
                VStack{
                    Spacer()
                    FooterView()
                        .frame(width: 395, height: 100)
                }
            }
        }
    }
}


struct MinionFamilyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MinionFamilyView()
        }
    }
}
