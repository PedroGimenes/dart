import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: Tela2(),
    debugShowCheckedModeBanner: false,
  ));
}

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _TelaPostState();
}

class _TelaPostState extends State<Tela2> {
  // 1. Iniciam vazias
  String titulo = '';
  String conteudo = '';
  bool carregando = true; // Controla se ainda está buscando na internet

  @override
  void initState() {
    super.initState();
    buscarPost();
  }

  Future<void> buscarPost() async {
    final url = Uri.parse('viacep.com.br/ws/01001000/json/');

    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body);

      // 2. Atualiza os dados e avisa que terminou de carregar
      setState(() {
        titulo = dados['title'];
        conteudo = dados['body'];
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 3. Enquanto estiver carregando, mostra a bolinha rodando
    if (carregando) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Consulta JSON padrão - 3F'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // 4. Quando o carregando virar false, ele mostra a tela com os dados
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta JSON padrão - 3F'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Título:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(titulo),
            const SizedBox(height: 10),
            const Text(
              'Conteúdo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(conteudo),
          ],
        ),
      ),
    );
  }
}
