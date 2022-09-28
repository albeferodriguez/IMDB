//
//  CurvedView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import SwiftUI

public enum AKCurvedViewType {
    public enum Side { case top, bottom }
    public enum Direction { case inwards, outwards}
}

public struct AKCurvedView<Content: View>: View {
    private let content: Content
    private let side: AKCurvedViewType.Side
    private let direction: AKCurvedViewType.Direction
    private let curveAmount: CGFloat
    private let backgroundColor: Color
    private let width: CGFloat
    private let height: CGFloat
    private var curveOffset: CGFloat {
        return direction == .outwards ? curveAmount : curveAmount * -1
    }

    public init(side: AKCurvedViewType.Side = .top,
         direction: AKCurvedViewType.Direction = .outwards, curveAmount: CGFloat = 40,
         backgroundColor: Color = .gray, width: CGFloat = 300,
         height: CGFloat = 300, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.side = side
        self.direction = direction
        self.curveAmount = curveAmount
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
    }

    public var body: some View {
        VStack {
            VStack {
                content
            }
            .frame(width: width, height: height, alignment: .top)
            .background(AKCurvedViewShape(curveOffset: curveOffset, side: side)
                            .fill(backgroundColor))
        }

    }
}

public struct AKCurvedViewShape: Shape {
    let curveOffset: CGFloat
    let side: AKCurvedViewType.Side

    public init(curveOffset: CGFloat, side: AKCurvedViewType.Side) {
        self.curveOffset = curveOffset
        self.side = side
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()
        switch side {
        case .top:
            path.move(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 0),
                              control: CGPoint(x: rect.width / 2, y: 0 - curveOffset))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        case .bottom:
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addQuadCurve(to: CGPoint(x: 0, y: rect.height),
                              control: CGPoint(x: rect.width / 2, y: rect.height + curveOffset))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
        return path
    }
}

public struct AKCurvedView_Previews: PreviewProvider {
    public static var previews: some View {
        Text("").background(AKCurvedView { Text( "nice") })
    }
}
