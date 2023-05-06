//
//  ContentView.swift
//  QuickPassword
//
//  Created by Omar Leal on 5/6/23.
//

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


struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                headerBackground
                Spacer()
            }
            
            VStack {
                headerButtons
            }
            
            VStack {
                headerCard
            }
        }
        
    }
}





// MARK: HEADER BACKGROUND
extension ContentView {
    var headerBackground: some View {
        Rectangle()
            .fill(LinearGradient(colors: [
                Color(red: 82/255, green: 133/255, blue: 246/255),
                Color(red: 40/255, green: 92/255, blue: 222/255),
                Color(red: 40/255, green: 92/255, blue: 222/255)
            ],
                startPoint: .bottom, endPoint: .top))
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .mask {
                CustomRectangle()
            }
            .edgesIgnoringSafeArea(.top)
    }
}

//MARK: HEADER BUTTONS
extension ContentView {
    var headerButtons: some View {
        HStack{
            Button {
                print("Header")
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
            }.padding(.horizontal, 20)
                .padding(.vertical, 10)
            Spacer()
            Text("Quick Password")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Button {
                print("Header")
            } label: {
                Image(systemName: "trash.circle")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
            }.padding(.horizontal, 20)
                .padding(.vertical, 10)
            
        }
    }
}

// MARK: HEADER CARD
extension ContentView  {
    var headerCard: some View {
        HStack {
            VStack {
               
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
