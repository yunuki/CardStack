//
//  CardStackView.swift
//  CardStack
//
//  Created by 윤재욱 on 2022/10/28.
//

import SwiftUI

enum CardResult {
    case none, positive, negative
}

struct CardStackView: View {
    @State var cardStack = CardStack(cardList: [], visibleCount: 0)
    @State private var removedList: [Card] = []
    let scaleFactor: CGFloat
    let bottomOffset: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            Button("Reset") {
                cardStack.cardList = removedList
                removedList = []
            }
            ForEach(Array(cardStack.visibleCards.enumerated()), id: \.element.id) { index, card in
                CardView(card: card)
                    .scaleEffect(
                        CGSize(
                            width: 1.0 - scaleFactor * CGFloat(cardStack.visibleCards.count - index),
                            height: 1.0 - scaleFactor * CGFloat(cardStack.visibleCards.count - index)
                        )
                    )
                    .offset(x: 0, y: -bottomOffset * CGFloat(index))
                    .animation(Animation.default, value: cardStack)
                    .draggable(onEnded: { result in
                        removedList.append(cardStack.cardList.removeFirst())
                    })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        let cardStack = CardStack(
            cardList: Card.makeDummyList(10),
            visibleCount: 3
        )
        CardStackView(
            cardStack: cardStack,
            scaleFactor: 0.066,
            bottomOffset: 30
        )
    }
}
