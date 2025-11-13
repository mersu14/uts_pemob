import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _input = '';
  String _output = '0';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '0';
      } else if (value == 'DEL') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        _calculateResult();
      } else if (value == '√') {
        try {
          double number = double.parse(_input);
          _output = sqrt(number).toStringAsFixed(4);
          _input = _output;
        } catch (_) {
          _output = 'Error';
        }
      } else if (value == 'x²') {
        try {
          double number = double.parse(_input);
          _output = pow(number, 2).toString();
          _input = _output;
        } catch (_) {
          _output = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  void _calculateResult() {
    try {
      String finalInput = _input.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _output = eval.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> buttons = [
      'C', 'DEL', '√', 'x²',
      '7', '8', '9', '÷',
      '4', '5', '6', '×',
      '1', '2', '3', '-',
      '0', '.', '=', '+',
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe0f7fa), Color(0xFF80deea)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Layar hasil
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _input,
                      style: const TextStyle(fontSize: 32, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _output,
                      style: const TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Grid tombol
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, -2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final btn = buttons[index];
                    return ElevatedButton(
                      onPressed: () => _buttonPressed(btn),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getButtonColor(btn),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        shadowColor: Colors.black38,
                        elevation: 6,
                      ),
                      child: Text(
                        btn,
                        style: TextStyle(
                          fontSize: 24,
                          color: _getTextColor(btn),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(String btn) {
    if (btn == 'C' || btn == 'DEL') return Colors.redAccent;
    if (btn == '=' || btn == '+' || btn == '-' || btn == '×' || btn == '÷') {
      return Colors.teal;
    }
    return Colors.grey[200]!;
  }

  Color _getTextColor(String btn) {
    if (btn == 'C' || btn == 'DEL' || btn == '=' || btn == '+' || btn == '-' || btn == '×' || btn == '÷') {
      return Colors.white;
    }
    return Colors.black;
  }
}
