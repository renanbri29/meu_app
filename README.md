# meu_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<img width="1502" height="874" alt="Image" src="https://github.com/user-attachments/assets/da6e357a-d4f3-4b09-bee8-b5a6f7612a50" />

---

### 1. Widgets Tree (Hierarquia em Texto / Árvore)

```text
MyApp
 └─ MaterialApp
     └─ HomePage (StatefulWidget)
         └─ Scaffold
             ├─ AppBar
             │   └─ Text ("Calculator")
             └─ Column (body)
                 ├─ Expanded (Área do Visor / Displays)
                 │   └─ Container
                 │       └─ Column
                 │           ├─ Container (Entrada do utilizador)
                 │           │   └─ Text (userInput)
                 │           └─ Container (Resultado)
                 │               └─ Text (answer)
                 └─ Expanded (Área dos Botões / Grid)
                     └─ Container
                         └─ GridView.builder
                             └─ MyButton (várias instâncias para os botões)
                                 └─ GestureDetector
                                     └─ Padding
                                         └─ ClipRRect
                                             └─ Container
                                                 └─ Center
                                                     └─ Text (buttonText)

```

---

### 2. Diagrama Estrutural Explicação do Código


#### **A. Estrutura Principal e Navegação**

* **`MyApp`**: Widget raiz que inicia a aplicação.
* **`MaterialApp`**: Configura o tema global e define a `HomePage` como a ecrã inicial.
* **`HomePage` (`StatefulWidget`)**: Gere o estado da calculadora (as variáveis `userInput` e `answer`).

#### **B. Estrutura da tela (`Scaffold`)**

O `Scaffold` divide o ecrã em duas partes principais:

1. **`AppBar`**: Barra superior com o título "Calculator".
2. **`Column` (`body`)**: Organiza o ecrã verticalmente em duas secções através de widgets `Expanded`:
* **Primeiro `Expanded` (Flex: 1)**: É o visor da calculadora. Contém uma `Column` com dois `Text` para exibir a expressão digitada (`userInput`) e o resultado processado (`answer`).
* **Segundo `Expanded` (Flex: 3)**: Ocupa a maior parte da ecrã com um `GridView.builder` disposto numa grelha de 4 colunas (`crossAxisCount: 4`).



#### **C. Componentes Interativos (`MyButton`)**

* **`GridView.builder`**: Constrói dinamicamente os botões a partir da lista `buttons`.
* **`MyButton` (`StatelessWidget`)**:
* Envolve o botão com um **`GestureDetector`** para detetar o toque (`onTap`).
* Usa um **`Container`** estilizado e centraliza o texto (**`Text`**) de cada botão com personalização de cores dependendo do tipo (operador, botão de igual ou botão de limpar).
