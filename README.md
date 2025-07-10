
# VaultBoy

VaultBoy é um aplicativo de gerenciamento de senhas inspirado no Pip-Boy de Fallout, desenvolvido com foco total em segurança, para demonstrar práticas de segurança no desenvolvimento iOS com Swift, utilizando Keychain, biometria e boas práticas de criptografia.

## Objetivo

Demonstrar, na prática, o uso de recursos nativos de segurança do iOS como fundação do desenvolvimento de um aplicativo, minimizando a dívida técnica de escalabilidade futura.

## Funcionalidades

- Tela de login com autenticação biométrica (Face ID ou Touch ID)
- Armazenamento de senhas no Keychain, nunca em texto puro
- Criação de registros de serviços e senhas (ex: "Gmail", "senha123!")
- Visual retro/minimalista inspirado em terminal ou Pip-Boy
- Bloqueio automático ao sair do app ou após inatividade
- Opção de gerar senhas seguras aleatórias
- Acesso autenticado para visualizar ou deletar entradas

## Stack

- Swift 5
- SwiftUI
- Keychain Services API
- LocalAuthentication (Face ID / Touch ID)

## Boas Práticas de Segurança Demonstradas

- Armazenamento seguro com Keychain
- Proteção contra Shoulder Surfing (campos ofuscados)
- Validação de tempo de sessão
- Sem armazenamento inseguro (UserDefaults, arquivos, etc.)
- Sem dependências desnecessárias
- Não-envio de dados para a nuvem
- Gerador de senhas fortes com regras de complexidade

## Organização do Código

```
VaultBoy/
├── Models/
│   └── PasswordEntry.swift
├── Views/
│   └── PasswordListView.swift
│   └── AddPasswordView.swift
├── ViewModels/
│   └── VaultViewModel.swift
├── Services/
│   └── KeychainService.swift
├── Resources/
│   └── Assets.xcassets
├── Utils/
│   └── PasswordGenerator.swift
└── VaultBoyApp.swift
```

## Possíveis Atualizações Futuras

- Exportação segura criptografada das senhas
- Modo de "desaparecimento": apaga os dados após X tentativas falhas
- Compartilhamento com dispositivos confiáveis via AirDrop com criptografia ponta-a-ponta

## Licença

Este projeto é de uso educacional. Sinta-se à vontade para expandi-lo, mas **não o utilize como seu único gerenciador de senhas pessoal em produção**.

---
