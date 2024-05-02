//
//  CollectionView1.swift
//  Mindoro Application
//
//  Created by Nithya Setlur on 2/5/2024.
//

import SwiftUI

struct CollectionView1: View {
    var body: some View {
        VStack{
            Image("Collection")
                .resizable()
                .scaledToFill()
            Spacer()
            FooterView()
                .frame(width: 395, height: 100)
        }
    }
}

#Preview {
    CollectionView1()
}
