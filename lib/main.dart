import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String display = '0';

  double? primeiroNumero;
  String? operador;
  bool novoNumero = false;

  void pressionarNumero(String numero) {
    setState(() {
      if (display == '0' || novoNumero) {
        display = numero;
        novoNumero = false;
      } else {
        display += numero;
      }
    });
  }

  void pressionarDecimal() {
    setState(() {
      if (novoNumero) {
        display = '0.';
        novoNumero = false;
      } else if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  void pressionarOperador(String novoOperador) {
    final numeroAtual = double.tryParse(display);

    if (numeroAtual == null) return;

    setState(() {
      if (primeiroNumero != null && operador != null) {
        calcular();
      } else {
        primeiroNumero = numeroAtual;
      }

      operador = novoOperador;
      novoNumero = true;
    });
  }

  void calcular() {
    if (primeiroNumero == null || operador == null) return;

    final segundoNumero = double.tryParse(display);

    if (segundoNumero == null) return;

    double resultado;

    switch (operador) {
      case '+':
        resultado = primeiroNumero! + segundoNumero;
        break;

      case '-':
        resultado = primeiroNumero! - segundoNumero;
        break;

      case '×':
        resultado = primeiroNumero! * segundoNumero;
        break;

      case '÷':
        if (segundoNumero == 0) {
          display = 'Erro';
          primeiroNumero = null;
          operador = null;
          novoNumero = true;
          return;
        }

        resultado = primeiroNumero! / segundoNumero;
        break;

      default:
        return;
    }

    display = formatarNumero(resultado);
    primeiroNumero = resultado;
    operador = null;
  }

  String formatarNumero(double numero) {
    if (numero == numero.toInt()) {
      return numero.toInt().toString();
    }

    return numero.toString();
  }

  void pressionarIgual() {
    setState(() {
      calcular();
      novoNumero = true;
    });
  }

  void limpar() {
    setState(() {
      display = '0';
      primeiroNumero = null;
      operador = null;
      novoNumero = false;
    });
  }

  void apagar() {
    setState(() {
      if (display.length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = '0';
      }
    });
  }

  Widget botao(
    String texto, {
    VoidCallback? onPressed,
    bool operador = false,
    bool igual = false,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: igual
                ? Colors.orange
                : operador
                    ? Colors.blueGrey.shade700
                    : Colors.grey.shade900,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    display,
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),

            // Botões
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      botao(
                        'C',
                        onPressed: limpar,
                        operador: true,
                      ),
                      botao(
                        '⌫',
                        onPressed: apagar,
                        operador: true,
                      ),
                      botao(
                        '÷',
                        onPressed: () => pressionarOperador('÷'),
                        operador: true,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      botao(
                        '7',
                        onPressed: () => pressionarNumero('7'),
                      ),
                      botao(
                        '8',
                        onPressed: () => pressionarNumero('8'),
                      ),
                      botao(
                        '9',
                        onPressed: () => pressionarNumero('9'),
                      ),
                      botao(
                        '×',
                        onPressed: () => pressionarOperador('×'),
                        operador: true,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      botao(
                        '4',
                        onPressed: () => pressionarNumero('4'),
                      ),
                      botao(
                        '5',
                        onPressed: () => pressionarNumero('5'),
                      ),
                      botao(
                        '6',
                        onPressed: () => pressionarNumero('6'),
                      ),
                      botao(
                        '-',
                        onPressed: () => pressionarOperador('-'),
                        operador: true,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      botao(
                        '1',
                        onPressed: () => pressionarNumero('1'),
                      ),
                      botao(
                        '2',
                        onPressed: () => pressionarNumero('2'),
                      ),
                      botao(
                        '3',
                        onPressed: () => pressionarNumero('3'),
                      ),
                      botao(
                        '+',
                        onPressed: () => pressionarOperador('+'),
                        operador: true,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      botao(
                        '0',
                        onPressed: () => pressionarNumero('0'),
                      ),
                      botao(
                        '.',
                        onPressed: pressionarDecimal,
                      ),
                      botao(
                        '=',
                        onPressed: pressionarIgual,
                        igual: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}