import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela 3')),
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
