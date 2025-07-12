//
//  PasswordEntry.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import Foundation

struct PasswordEntry: Identifiable {
    var id = UUID()
    var platform: String
    var password: String
}
