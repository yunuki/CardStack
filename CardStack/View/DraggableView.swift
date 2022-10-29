//
//  DraggableView.swift
//  CardStack
//
//  Created by 윤재욱 on 2022/10/28.
//

import SwiftUI

struct DraggableView: ViewModifier {
    @State private var offset = CGPoint(x: 0.0, y: 0.0)
    @State private var result: CardResult = .none
    let onEnded: (CardResult) -> Void
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: Double(offset.x) * 0.1))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.offset.x += value.translation.width
                        self.offset.y += value.translation.height
                        result = self.offset.x > 0 ? .positive : .negative
                    })
                    .onEnded({ value in
                        onEnded(result)
                        result = .none
                    })
            )
            .foregroundColor(color(result))
            .offset(x: offset.x, y: offset.y)
    }
    
    func color(_ result: CardResult) -> Color {
        switch result {
        case .none:
            return .white
        case .positive:
            return .blue
        case .negative:
            return .red
        }
    }
}

extension View {
    func draggable(onEnded: @escaping (CardResult) -> Void) -> some View {
        return modifier(DraggableView(onEnded: onEnded))
    }
}
