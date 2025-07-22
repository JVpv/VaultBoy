//
//  PasswordListView.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import LocalAuthentication
import CryptoKit
import SwiftUI

struct PasswordListView: View {
    var passwordEntry: PasswordEntry
    @State private var isAuthenticated = false
    @Binding var showingPassword: PasswordEntry?
    
    var body: some View {
        VStack {
            Text(passwordEntry.service)
        .font(.custom("Overseer", size: 28)).foregroundStyle(Color(hex: vaultBoyGreen))
            Text(passwordEntry.account).font(.headline).foregroundStyle(Color(hex: vaultBoyGreen))
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
        .onAppear {
            authenticateUser()
        }
    }
    
    private func authenticateUser() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autentique-se para acessar suas senhas") { success, authenticationError in
                DispatchQueue.main.async {
                    self.isAuthenticated = success
                }
            }
        } else {
            self.isAuthenticated = true
        }
    }

    private func generateSHA256Hash(for password: String) -> String {
        let data = Data(password.utf8)
        let hash = SHA256.hash(data: data)
        
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }

}
