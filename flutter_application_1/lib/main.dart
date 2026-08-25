import 'package:flutter/material.dart';
import './tela2.dart';
import './tela3.dart';
import './tela4.dart';
import './tela5.dart';

void main() {
  runApp(const MaterialApp(home: Tela1()));
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Tela2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela2()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Tela3'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela3()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Tela4'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela4()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Tela5'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela5()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
