import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(home: Tela2(), debugShowCheckedModeBanner: false));
}

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _TelaPostState();
}

class _TelaPostState extends State<Tela2> {
  // Variáveis para armazenar os dados do CEP
  String cep = '';
  String logradouro = '';
  String complemento = '';
  String unidade = '';
  String bairro = '';
  String localidade = '';
  String uf = '';
  String estado = '';
  String regiao = '';
  String ibge = '';
  String gia = '';
  String ddd = '';
  String siafi = '';

  bool carregando = true;

  @override
  void initState() {
    super.initState();
    buscarPost();
  }

  Future<void> buscarPost() async {
    final url = Uri.parse('https://viacep.com.br/ws/01001000/json/');

    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body);

      // Atualiza os dados recebidos da API
      setState(() {
        cep = dados['cep'];
        logradouro = dados['logradouro'];
        complemento = dados['complemento'];
        unidade = dados['unidade'];
        bairro = dados['bairro'];
        localidade = dados['localidade'];
        uf = dados['uf'];
        estado = dados['estado'];
        regiao = dados['regiao'];
        ibge = dados['ibge'];
        gia = dados['gia'];
        ddd = dados['ddd'];
        siafi = dados['siafi'];

        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Consulta CEP - 3F'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP - 3F'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CEP:',
            ),
            Text(cep),
            const Text(
              'Logradouro:',
            ),
            Text(logradouro),
            const Text(
              'Complemento:',
            ),
            Text(complemento),
            const Text(
              'Unidade:',
            ),
            Text(unidade),
            const Text(
              'Bairro:',
            ),
            Text(bairro),
            const Text(
              'Localidade:',
            ),
            Text(localidade),
            const Text(
              'UF:',
            ),
            Text(uf),
            const Text(
              'Estado:',
            ),
            Text(estado),
            const Text(
              'Região:',
            ),
            Text(regiao),
            const Text(
              'IBGE:',
            ),
            Text(ibge),
            const Text(
              'GIA:',
            ),
            Text(gia),
            const Text(
              'DDD:',
            ),
            Text(ddd),
            const Text(
              'SIAFI:',
            ),
            Text(siafi),
          ],
        ),
      ),
    );
  }
}
