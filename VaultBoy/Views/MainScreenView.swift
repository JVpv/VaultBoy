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
    @State private var account = ""
    private let placeholderTextInsets: EdgeInsets = EdgeInsets(top: 0, leading: 31, bottom: 0, trailing: 0)
    
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
                VStack {
                    ZStack(alignment: .leading) {
                        if account == "" {
                            Text("Digite a conta a ser pesquisada...").foregroundStyle(Color(hex: vaultBoyGreen)).padding(placeholderTextInsets)
                        }
                        TextField("", text: $account)
                            .padding().foregroundStyle(Color(hex: vaultBoyGreen)).border(Color(hex: vaultBoyGreen), width: 2).cornerRadius(2).padding()
                    }
                    Button {
                        viewModel.loadPasswords(account: account)
                    } label: {
                        Text("Pesquisar")
                            .padding()
                    }.foregroundStyle(Color(hex: vaultBoyGreen)).border(Color(hex: vaultBoyGreen), width: 2).cornerRadius(2).padding()
                }
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
