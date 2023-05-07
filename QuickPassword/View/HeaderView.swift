//
//  ContentView.swift
//  QuickPassword
//
//  Created by Omar Leal on 5/6/23.
//

import SwiftUI





struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ///MARK: APP BACKGROUND
            VStack {
                headerBackground
               Spacer()
            }
            
            //MARK: HEADER BUTTONS
            VStack {
                headerButtons
            }
            
            VStack {
                Spacer() .frame(height: 60)
                headerCard
                sectionTitle
//                VStack(spacing: 20) {
//                    ScrollView(.vertical, showsIndicators: false) {
//                       PasswordCard()
//                        PasswordCard()
//                        PasswordCard()
//                        PasswordCard()
//                        PasswordCard()
//                    }
//                }.padding(.top)
                
                
            }
    
           
        }
        
      
       
        
    }
}





// MARK: HEADER BACKGROUND
extension HeaderView {
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
extension HeaderView {
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
extension HeaderView  {
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

extension HeaderView {
    var sectionTitle: some View {
        VStack {
            Text("Recently")
                .foregroundColor(.primary)
                .bold()
                .font(.system(size: 20))
                .offset(x: -140)
                
        }
        .frame(maxWidth: .infinity)
            .frame(height: 50)
            .cornerRadius(10)
          //  .padding(.top, 2)
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
