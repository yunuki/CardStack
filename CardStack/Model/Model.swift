//
//  Model.swift
//  CardStack
//
//  Created by 윤재욱 on 2022/10/28.
//

import Foundation

struct Card {
    var id: String
    var result: CardResult = .none
    
    static func makeDummyList(_ num: Int) -> [Card] {
        return (0..<num).map { Card(id: "\($0)") }
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}

struct CardStack {
    var cardList: [Card]
    let visibleCount: Int
    var visibleCards: [Card] {
        return Array(
            cardList
                .reversed()
                .suffix(from: max(cardList.count - visibleCount, 0))
        )
    }
}

extension CardStack: Equatable {
    static func == (lhs: CardStack, rhs: CardStack) -> Bool {
        return lhs.cardList == rhs.cardList
    }
}
