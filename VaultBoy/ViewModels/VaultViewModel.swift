//
//  VaultViewModel.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import Foundation
import Security
import SwiftUI

import SwiftUI

class VaultViewModel: ObservableObject {
    
    @Published var passwordEntries: [PasswordEntry] = []
    
    // Salvar nova senha no Keychain
    func addPassword(service: String, account: String, password: String) {
        // Salva a senha no Keychain
        let success = KeychainService.shared.savePassword(service: service, account: account, password: password)
        
        // Se for bem-sucedido, atualiza a lista de senhas
        if success {
            let newEntry = PasswordEntry(id: UUID(), service: service, account: account, password: password)
            passwordEntries.append(newEntry)
        }
    }
    
    // Recuperar senhas do Keychain
    func loadPasswords(account: String) {
        let services = ["Google", "Facebook", "Instagram"] // Lista de serviços que você vai buscar
        
        for service in services {
            if let password = KeychainService.shared.getPassword(service: service, account: account) {
                let entry = PasswordEntry(id: UUID(), service: service, account: account, password: password)
                passwordEntries.append(entry)
            }
        }
    }
    
    func generateRandomPassword(service: String, account: String) {
        let password = GenerateRandomPassword.shared.generateRandomPassword()
        
        let newPassword = PasswordEntry(service: service, account: account, password: password)
        passwordEntries.append(newPassword)
    }
}
