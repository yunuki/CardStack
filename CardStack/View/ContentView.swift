//
//  ContentView.swift
//  CardStack
//
//  Created by 윤재욱 on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
    let cardStack = CardStack(
        cardList: Card.makeDummyList(10),
        visibleCount: 3
    )
    
    var body: some View {
        CardStackView(
            cardStack: cardStack,
            scaleFactor: 0.066,
            bottomOffset: 30
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
