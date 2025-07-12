//
//  MainScreenView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 11/07/25.
//

import SwiftUI

struct MainScreenView: View {
    @State private var viewModel = VaultViewModel()
    @State private var degrees = 0.0
    @State private var showingPassword: PasswordEntry? = nil
    
    let timer = Timer.publish(every: 0.005, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack (alignment: .top){
            Color(hex: "000").edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                Image("Gear").resizable().frame(width: 100, height: 100, alignment: .leading).rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 0, z: 1)).onReceive(timer, perform: { _ in
                    if degrees < 360 {
                        degrees += 0.09
                    } else {
                        degrees = 0.09
                    }
                })
                Text("VaultBoy").foregroundStyle(Color(hex: vaultBoyGreen)).font(.custom("Overseer", size: 64))
                AddPasswordView(viewModel: $viewModel)
                ForEach(viewModel.passwordEntries, id: \.id) { password in
                    PasswordListView(passwordEntry: password, showingPassword: $showingPassword)
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
