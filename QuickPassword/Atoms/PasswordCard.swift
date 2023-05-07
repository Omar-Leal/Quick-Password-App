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
    @State var passwordLevel: Float = 0.6
    
    var body: some View {
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
                Text("\(passwordString)")
                    .font(.system(size: 18, weight: .bold))
             }
            
            HStack {
                LevelBar(passwordLevel: $passwordLevel)
                    .frame(height: 10)
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

struct PasswordCard_Previews: PreviewProvider {
    static var previews: some View {
        PasswordCard(passwordString: "aYi5471Yh6#", passwordStrength: 0.4, passwordLevel: 0.2)
    }
}
