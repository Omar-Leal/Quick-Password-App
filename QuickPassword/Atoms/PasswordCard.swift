//
//  PasswordCard.swift
//  QuickPassword
//
//  Created by Omar Leal on 5/7/23.
//

import SwiftUI

struct PasswordCard: View {
    @State var passwordString: String = ""
    @State var passwordStrength: Float = 0.5
    @State var successMessage: Bool = false
    @State var clipboardClicked: Bool = false
    
    var passwordScale: String {
        var level: String = ""
        switch passwordStrength {
        case 0.0...0.1: level = "Very Weak"
        case 0.2...0.3: level = "Weak"
        case 0.4...0.5: level = "Medium"
        case 0.6...0.7: level = "Acceptable"
        case 0.8...0.9: level = "Strong"
        case 1: level = "Very Strong"
        default: level = ".gray"
        }
        
        return level
    }
    
    
    var colorLevel: Color {
        var colour: Color
        switch passwordStrength {
        case 0.0...0.1: colour = .red
        case 0.2...0.3: colour = .orange.opacity(0.5)
        case 0.4...0.5: colour = .orange
        case 0.6...0.7: colour = .blue
        case 0.8...0.9: colour = .green.opacity(0.5)
        case 1: colour = .green
        default: colour = .gray
        }
        return colour
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
         
            HStack {
                Image(systemName: "key.radiowaves.forward.fill")
                Text("New Password")
                    .font(.custom("Poppins-Regular", size: 16))
                Spacer()
                Circle()
                    .fill(colorLevel)
                    .frame(width: 10, height: 10)
                Text("\(passwordScale)")
                    .font(.custom("Poppins-Regular", size: 14))
                
            }
            
            HStack {
                Text("\(passwordString)")
                    .font(.custom("Poppins-Regular", size: 20))
                    .bold()
                Spacer()
                Image(systemName: clipboardClicked ? "clipboard.fill" : "clipboard")
                    .foregroundColor(.gray)
                   
            }.onTapGesture {
                UIPasteboard.general.string = passwordString
                successMessage = true
                clipboardClicked = true

            }
            
            HStack {
                LevelBar(passwordLevel: $passwordStrength)
                    .frame(height: 10)
                Spacer()
                Text("Length: \(passwordString.count)")
                    .font(.custom("Poppins-Regular", size: 11))
                    .offset(x: 2, y: -2)
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 360)
        .padding(.vertical, 20)
        .shadow(color: Color.black.opacity(0.3), radius: 15.0, x: 0, y: 0)
       // .padding(.vertical)
      //  .padding(.horizontal, 0)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 0)
        .alert(isPresented:$successMessage, content: {
            Alert(title: Text("You copied \(passwordString)")
                .font(.custom("Montserrat-Regular", size: 22))
            )
                
        })
    }
}

struct PasswordCard_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
