//
//  VaultViewModel.swift
//  VaultBoy
//
//  Created by Jose Vitor Prado on 10/07/25.
//

import SwiftUI

class VaultViewModel: ObservableObject {
    @Published var passwordEntries = [
        PasswordEntry(platform: "Gmail", password: "p@ssw0rd"),
        PasswordEntry(platform: "AdventureQuestWorlds", password: "$3cretP@ssw0rd"),
        PasswordEntry(platform: "GitHub", password: "Ch4r1z@rd")
    ]
}
