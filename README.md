
# VaultBoy

VaultBoy é um aplicativo simples de gerenciamento de senhas inspirado no Pip-Boy do universo Fallout. Ele é desenvolvido com foco total em segurança — ideal para demonstrar práticas de segurança no desenvolvimento iOS com Swift, utilizando Keychain, autenticação biométrica (Face ID/Touch ID), e boas práticas de criptografia.

## Objetivo

Criar um app com funcionalidades mínimas que armazenam senhas localmente de maneira segura, utilizando recursos nativos de segurança do iOS. Um projeto perfeito para demonstrar conhecimento prático em segurança de aplicações móveis.

## Funcionalidades

- Tela de login com autenticação biométrica (Face ID ou Touch ID)
- Armazenamento de senhas no Keychain, nunca em texto puro
- Criação de registros de serviços e senhas (ex: "Gmail", "senha123!")
- Visual retro/minimalista inspirado em terminal ou Pip-Boy
- Bloqueio automático ao sair do app ou após inatividade
- Opção de gerar senhas seguras aleatórias
- Acesso autenticado para visualizar ou deletar entradas

## Tecnologias

- Swift 5
- UIKit ou SwiftUI (escolha do desenvolvedor)
- Keychain Services API
- LocalAuthentication (Face ID / Touch ID)

## Boas Práticas de Segurança Demonstradas

- Armazenamento seguro com Keychain
- Proteção contra Shoulder Surfing (campos ofuscados)
- Validação de tempo de sessão
- Sem armazenamento inseguro (UserDefaults, arquivos, etc.)
- Sem dependências desnecessárias
- App não envia dados para a nuvem
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

## Possíveis Extensões Futuras

- Exportação segura criptografada das senhas
- Modo de "desaparecimento": apaga os dados após X tentativas falhas
- Compartilhamento com dispositivos confiáveis via AirDrop com criptografia ponta-a-ponta

## Licença

Este projeto é de uso educacional. Sinta-se à vontade para expandi-lo, mas **não o utilize como seu único gerenciador de senhas pessoal em produção**.

---

> _“A guerra... a guerra nunca muda.”_ – Fallout
