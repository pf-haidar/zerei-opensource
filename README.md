# ZEREI

Projeto em Flutter para manter o backlog de jogos.

## LICENÇA DO CÓDIGO

Este projeto está sobre a licença GNU GPL v3.0.
Qualquer reutilização só é permitida em outros projetos de código aberto.

## Desenvolvimento do aplicativo
### Requisitos para o ambiente de desenvolvimento

**Versão Mínima do OS**

- Android Level 21 - 31 (5.0 - 12)

Software essesnciais para o desenvolvimento do aplicativo:

- [Flutter 3.0.1](https://docs.flutter.dev/development/tools/sdk/releases)
- [JDK 1.8.0_301](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html) 
- [Android SDKs](https://developer.android.com/about/versions/12/setup-sdk) - API Level 31 (Recomendado instalar via [Android Studio](https://developer.android.com/studio))

### Recomendações de Extensões do VSCode

- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

### Instalação do ambiente de desenvolvimento

1. Instalar ferramentas necessárias para o desenvolvimento (Veja em [Requisitos para o ambiente de desenvolvimento](#requisitos-para-o-ambiente-de-desenvolvimento))
2. Baixar as dependências do projeto via Terminal

```sh
$ flutter pub get
```

### Executando o projeto

A execução deve ser feita pelo Executar (F5).
Foi utilizado a IDE Visual Studio Code para desenvolvimento do projeto.
Recomendado o uso de um dispositivo mobile físico ou emulador para execução do projeto.

## Bibliotecas utilizadas:

- [http](https://pub.dev/packages/http)
- [mobx](https://pub.dev/packages/mobx)
- [flutter_mobx](https://pub.dev/packages/flutter_mobx)
- [provider](https://pub.dev/packages/provider)
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- [firebase_storage](https://pub.dev/packages/firebase_storage)