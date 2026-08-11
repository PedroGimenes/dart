import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Tela1()));

class Tela1 extends StatelessWidget {
  const Tela1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela 1')),
      body: Center(
        child: FloatingActionButton(
          child: const Text('Avançar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tela2()),
            );
          },
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela 2')),
      body: Center(
        child: FloatingActionButton(
          child: const Text('Voltar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
