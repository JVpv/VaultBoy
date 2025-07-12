//
//  PasswordListView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import SwiftUI

struct PasswordListView: View {
    var passwordEntry: PasswordEntry
    @State var isAuthenticated: Bool = false
    @Binding var showingPassword: PasswordEntry?
    
    var body: some View {
        HStack {
                    Text(passwordEntry.platform)
                .font(.headline).foregroundStyle(Color(hex: vaultBoyGreen))
                    Spacer()

                    if isAuthenticated, let showingPassword = showingPassword, showingPassword.id == passwordEntry.id {
                        Text(showingPassword.password)
                            .font(.body)
                            .foregroundStyle(Color(hex: vaultBoyGreen))
                    } else {
                        Text("[Oculta]")
                            .font(.body)
                            .foregroundStyle(Color(hex: vaultBoyGreen))
                    }

                    Button(action: {
                        isAuthenticated = authenticateUser()
                        if isAuthenticated {
                            if showingPassword?.id == passwordEntry.id {
                                self.showingPassword = nil
                            } else {
                                self.showingPassword = passwordEntry
                            }
                        }
                    }) {
                        Image(systemName: showingPassword?.id == passwordEntry.id ? "eye.slash.fill" : "eye.fill")
                            .foregroundStyle(Color(hex: vaultBoyGreen))
                    }
                    .padding(.leading)
                }
        .padding()
    }
}

private func authenticateUser() -> Bool {
    return true
}
