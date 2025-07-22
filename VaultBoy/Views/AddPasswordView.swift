//
//  AddPasswordView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import SwiftUI

struct AddPasswordView: View {
    
    @Binding var viewModel: VaultViewModel
    @State private var showAddPassword = false
    @State var service: String = ""
    @State var account: String = ""
    @State private var showingAlert = false
    private let placeholderTextInsets: EdgeInsets = EdgeInsets(top: 0, leading: 31, bottom: 0, trailing: 0)
    
    var body: some View {
        VStack {
            if showAddPassword {
                ZStack(alignment: .leading) {
                    if service == "" {
                        Text("Digite uma plataforma...").foregroundStyle(Color(hex: vaultBoyGreen)).padding(placeholderTextInsets)
                    }
                    TextField("", text: $service)
                        .padding().foregroundStyle(Color(hex: vaultBoyGreen)).border(Color(hex: vaultBoyGreen), width: 2).cornerRadius(2).padding()
                }
                ZStack(alignment: .leading) {
                    if account == "" {
                        Text("Digite o nome de usuário...").foregroundStyle(Color(hex: vaultBoyGreen)).padding(placeholderTextInsets)
                    }
                    TextField("", text: $account)
                        .padding().foregroundStyle(Color(hex: vaultBoyGreen)).border(Color(hex: vaultBoyGreen), width: 2).cornerRadius(2).padding()
                }
            }
            Button {
                if showAddPassword {
                    viewModel.generateRandomPassword(service: service, account: account)
                    showingAlert.toggle()
                }
                showAddPassword.toggle()
            } label: {
                Text(showAddPassword ? "Nova Senha" : "Adicionar Senha").font(.custom("Overseer", size: 20))
                    .padding()
            }.foregroundStyle(Color(hex: vaultBoyGreen)).border(Color(hex: vaultBoyGreen), width: 2).cornerRadius(2).padding()
        }.alert("Nova senha criada para \(service).", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                service = ""
                account = ""
            }
        }
    }
}

#Preview {
    MainScreenView()
}
