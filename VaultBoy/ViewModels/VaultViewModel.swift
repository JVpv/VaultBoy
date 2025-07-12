//
//  VaultViewModel.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import Foundation
import Security
import SwiftUI

class VaultViewModel: ObservableObject {
    @Published var passwordEntries = [
        PasswordEntry(service: "Gmail", password: "p@ssw0rd"),
        PasswordEntry(service: "AdventureQuestWorlds", password: "$3cretP@ssw0rd"),
        PasswordEntry(service: "GitHub", password: "Ch4r1z@rd")
    ]
    
    func generateRandomPassword(service: String) {
        let passwordLength = Int.random(in: 12...16)
        var password = ""

        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~`"
        var randomBytes = [UInt8](repeating: 0, count: passwordLength)
        
        let result = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        
        if result == errSecSuccess {
            for _ in randomBytes {
                password.append(characters.randomElement()!)
            }
        } else {
            // TODO: Bolar uma solução alternativa ou um aviso de erro
            print("Erro ao tentar gerar uma senha")
        }
        
        let newPassword = PasswordEntry(service: service, password: password)
        passwordEntries.append(newPassword)
    }
}
