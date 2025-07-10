//
//  PasswordListView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import SwiftUI
import WebKit

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct PasswordListView: View {
    @State private var degrees = 0.0
    
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack (alignment: .top){
            Color(hex: "000").edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                Image("Gear").resizable().frame(width: 100, height: 100, alignment: .leading).rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 0, z: 1)).onReceive(timer, perform: { _ in
                    if degrees < 360 {
                        degrees += 0.9
                    } else {
                        degrees = 0.9
                    }
                })
                Text("VaultBoy").foregroundStyle(Color(hex: "008000")).font(.custom("Overseer", size: 64))
                Button {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label: {
                    Text("Add Password").font(.custom("Overseer", size: 20))
                        .padding()
                }.foregroundStyle(Color(hex: "008000")).border(Color(hex: "008000"), width: 2).cornerRadius(2).padding()
            }
        }
    }
}

#Preview {
    PasswordListView()
}
