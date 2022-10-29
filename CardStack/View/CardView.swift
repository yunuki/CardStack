//
//  CardView.swift
//  CardStack
//
//  Created by 윤재욱 on 2022/10/28.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        Rectangle()
            .overlay(content: {
                Text("Card \((Int(card.id) ?? 0) + 1)")
                    .foregroundColor(.black)
            })
            .aspectRatio(CGSize(width: 1.6, height: 0.9), contentMode: .fit)
            .cornerRadius(8)
            .shadow(color: .gray, radius: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: "0"))
    }
}
