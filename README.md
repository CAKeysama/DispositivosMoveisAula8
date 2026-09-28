# Aula 8 — Listas dinâmicas e arquitetura modular

Aplicação Flutter desenvolvida para o laboratório de **Programação para Dispositivos Móveis I**. O catálogo demonstra renderização eficiente com `ListView.builder`, componentes reutilizáveis e separação de responsabilidades.

## Funcionalidades

- Catálogo de produtos com `ListView.builder` (renderização sob demanda).
- `ProdutoCard` reutilizável com `Card`, `ListTile` e Material Design 3.
- Inclusão dinâmica usando `FloatingActionButton` e `setState()`.
- Remoção por gesto com `Dismissible` e opção de desfazer.
- Navegação para detalhes do produto passando o modelo pelo construtor.
- Contador de itens atualizado automaticamente.

## Organização

```text
lib/
├── main.dart
├── models/
│   └── produto.dart
├── screens/
│   ├── catalogo_screen.dart
│   └── detalhes_produto_screen.dart
└── widgets/
    └── produto_card.dart
```

## Como executar

Pré-requisitos: Flutter 3.16 ou superior.

```bash
flutter pub get
flutter run
```

Para validar o projeto:

```bash
flutter analyze
flutter test
```

## Evidências para entrega

Ao executar em um emulador ou dispositivo, capture:

1. A tela inicial com os cinco produtos e o contador de itens.
2. Um produto após tocar no botão **Adicionar**.
3. O estado de confirmação após deslizar um card para removê-lo.
4. A tela de detalhes aberta ao tocar em um produto.

## Versionamento

Os commits seguem o padrão semântico (`feat`, `fix`, `docs`). O repositório deve ser submetido com seu link público do GitHub na plataforma de aprendizagem.
