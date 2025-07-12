//
//  PasswordListView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import CryptoKit
import SwiftUI

struct PasswordListView: View {
    var passwordEntry: PasswordEntry
    @State var isAuthenticated: Bool = false
    @Binding var showingPassword: PasswordEntry?
    
    var body: some View {
        VStack {
            Text(passwordEntry.service)
        .font(.headline).foregroundStyle(Color(hex: vaultBoyGreen))
            HStack {
                if isAuthenticated, let showingPassword = showingPassword, showingPassword.id == passwordEntry.id {
                    Text(showingPassword.password)
                        .font(.body)
                        .foregroundStyle(Color(hex: vaultBoyGreen))
                } else {
                    Text(generateSHA256Hash(for: passwordEntry.password))
                        .font(.body)
                        .foregroundStyle(Color(hex: vaultBoyGreen))
                }
                Spacer()
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
        }
        .padding()
    }
}

private func authenticateUser() -> Bool {
    return true
}

private func generateSHA256Hash(for password: String) -> String {
    let data = Data(password.utf8)
    let hash = SHA256.hash(data: data)
    
    return hash.map { String(format: "%02hhx", $0) }.joined()
}
