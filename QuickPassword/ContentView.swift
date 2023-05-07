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
                Spacer() .frame(height: 60)
                headerCard
                sectionTitle
                VStack(spacing: 20) {
                    ScrollView(.vertical, showsIndicators: false) {
                        PasswordCard
                        PasswordCard
                        PasswordCard
                        PasswordCard
                        PasswordCard
                        PasswordCard
                    }
                }.padding(.top)
            }
            
           
        }
        
      
        
       
        
    }
}





// MARK: HEADER BACKGROUND
extension ContentView {
    var headerBackground: some View {
        Rectangle()
            .fill(Color(red: 0.365, green: 0.373, blue: 0.937))
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
            Spacer()
                    VStack {
                       Text("Capital")
                            .font(.system(size: 18, weight: .medium))
                        Text("Off")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                            .bold()
                    }
            Spacer()
                    VStack {
                       Text("Symbol")
                            .font(.system(size: 18, weight: .medium))
                        Text("On")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.green)
                    }
            Spacer()
                    VStack {
                       Text("Length")
                            .font(.system(size: 18, weight: .medium))
                        Text("10")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.gray)
                    }
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(color: Color.black.opacity(0.3), radius: 15)
        .padding(.horizontal, 28)
    }
}

extension ContentView {
    var sectionTitle: some View {
        VStack(alignment: .leading) {
            Text("Recently created")
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 20))
                
        }
            .frame(width: 200)
            .frame(height: 50)
            .background(.white)
            .cornerRadius(10)
            .padding(.top, 2)
    }
}

extension ContentView {
    var PasswordCard: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack {
                Image(systemName: "key.radiowaves.forward.fill")
                Text("New Password")
                Spacer()
                Circle()
                    .frame(width: 10, height: 10)
                Text("Strong")
            }.foregroundColor(.gray)
            
            HStack {
                Text("Request for a new Apple Macbook Pro")
                    .font(.system(size: 16, weight: .bold))
               
                
            }
            
            HStack {
                Text("For")
                Text("Omar Leal")
                Spacer()
                Text("Length: 8")
                   
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 15.0, x: 0, y: 0)
       // .padding(.vertical)
        .padding(.horizontal, 20)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
