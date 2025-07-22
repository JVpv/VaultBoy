//
//  PasswordEntry.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import Foundation

struct PasswordEntry: Identifiable {
    var id = UUID()
    var service: String
    var account: String
    var password: String
}
