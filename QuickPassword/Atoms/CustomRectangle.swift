import SwiftUI

struct CustomRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        // adding points to drawing the rect
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxX))
       
        // adding point to drawing the curve in the bellow side
        let c1 = CGPoint(x: rect.midX + 50, y: rect.maxX + 20)
        let c2 = CGPoint(x: rect.midX - 50, y: rect.maxY + 20)
        path.addCurve(
            to: CGPoint(x: rect.minY, y: rect.maxY),
            control1: c1,
            control2: c2)
        path.closeSubpath()
        
        return path
    }
}

