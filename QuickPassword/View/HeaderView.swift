//
//  ContentView.swift
//  QuickPassword
//
//  Created by Omar Leal on 5/6/23.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var vm: PasswordViewModel
 
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
            VStack {
                VStack(alignment: .leading){
                    
                    Rectangle()
                        .fill(Color(red: 0.769, green: 0.769, blue: 0.769).opacity(0.2))
                        .frame(width: 40, height: 10)
                        .cornerRadius(10, corners: [.topRight, .bottomRight])
                    Rectangle()
                        .fill(Color(red: 0.769, green: 0.769, blue: 0.769).opacity(0.2))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10, corners: [.topRight, .bottomRight])
                    Rectangle()
                        .fill(Color(red: 0.769, green: 0.769, blue: 0.769).opacity(0.2))
                        .frame(width: 100, height: 10)
                        .cornerRadius(10, corners: [.topRight, .bottomRight])
                }
                
              
            }
            Spacer()
            HStack {
                Text("Quick")
                    .font(.custom("Poppins-Bold", size: 26))
                    .bold()
                    .foregroundColor(.white)
                    .underline()
                Text("Password")
                    .font(.custom("Poppins-Bold", size: 26))
                    .bold()
                    .foregroundColor(.white)
            }
            
                .offset(x: 30, y:0)
            Spacer()
            
            
        }
        
    }
}

// MARK: HEADER CARD
extension HeaderView  {
    var headerCard: some View {
        HStack {
            Spacer()
                    VStack(spacing: 10) {
                       Text("Capital")
                            .font(.custom("Poppins-Bold", size: 14))
                          
                        
                        Text(vm.withUpperCase ? "On" : "Off")
                            .font(.custom("Poppins-Bold", size: 14))
                            .foregroundColor(vm.withUpperCase ? .green : .primary.opacity(0.4))
                            
                            .shadow(color: .green, radius: 15)
                        
                     }
            Spacer()
                    VStack(spacing: 10) {
                       Text("Custom Length")
                           // .font(.system(size: 14, weight: .medium))
                            .font(.custom("Poppins-Bold", size: 14))
                        Text(vm.length == 0 ? "No set" : "\(vm.length)")
                            .font(.custom("Poppins-Bold", size: 14))
                            .foregroundColor(vm.length > 0 ? .green : .primary.opacity(0.4))
                            
                    }
            Spacer()
                    VStack(spacing: 10) {
                       Text("Symbol")
                            .font(.custom("Poppins-Bold", size: 14))
                        Text(vm.withSymbols ? "On" : "Off")
                            .font(.custom("Poppins-Bold", size: 14))
                            .foregroundColor(vm.withSymbols ? .green : .primary.opacity(0.4))
                            .bold()
                            .shadow(color: .green, radius: 15)
                    }
            Spacer()
        }
        .frame(width: 330, height: 70)
        .background(.ultraThinMaterial)
        .shadow(color: Color.black.opacity(0.3), radius: 15)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

extension HeaderView {
    var sectionTitle: some View {
        HStack {
            Text("Recently")
                .foregroundColor(.primary)
                .font(.custom("Poppins-Regular", size: 20))
               // .offset(x: -140)
            Spacer()
            Button {
                vm.passwords = []
            } label: {
                Image(systemName: "trash.circle.fill")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 24))
            }
            
                
        }
        //.frame(maxWidth: .infinity)
            .frame(height: 50)
            .cornerRadius(10)
            .padding(.horizontal, 10)
          //  .padding(.top, 2)
    }
}




struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            
    }
}


