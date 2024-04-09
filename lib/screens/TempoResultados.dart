import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/DadosMercado.dart';
import 'menu_data.dart';

class TempoResultados extends StatelessWidget {


  DadosMercado dadosMercado1 = DadosMercado();
  DadosMercado dadosMercado2 = DadosMercado();
  DadosMercado dadosMercado3 = DadosMercado();

  String nomeMoeda1;
  String nomeMoeda2;
  String nomeMoeda3;

  TempoResultados(this.dadosMercado1,
      this.dadosMercado2,
      this.dadosMercado3,
      this.nomeMoeda1,
      this.nomeMoeda2,
      this.nomeMoeda3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body:
      Container(
        margin: EdgeInsets.all(0),
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Dados de Processamento:",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 64.00,
            //   padding: EdgeInsets.only(left: 8.00, right: 8.00),
            //   child: Card(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           widget.listaMercado1.nome.toString(),
            //           style: TextStyle(fontSize: 24),
            //         ),
            //         Text(
            //           widget.listaMercado2.nome.toString(),
            //           style: TextStyle(fontSize: 24),
            //         ),
            //         Text(
            //           widget.listaMercado3.nome.toString(),
            //           style: TextStyle(fontSize: 24),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   padding: EdgeInsets.only(left: 8.00, right: 8.00, bottom: 8.00),
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       dadosMercado1 = estatistica(widget.listaMercado1);
            //       dadosMercado2 = estatistica(widget.listaMercado2);
            //       dadosMercado3 = estatistica(widget.listaMercado3);
            //
            //       double retornoDados1 = dadosMercado1.retorno[index];
            //       double retornoDados2 = dadosMercado2.retorno[index];
            //       double retornoDados3 = dadosMercado3.retorno[index];
            //
            //       return _RetornoItem(retornoDados1, retornoDados2, retornoDados3);
            //     },
            //     itemCount: widget.listaMercado1.precoMoeda.length,
            //   ),
            // ),
            const Text(
              "Retornos [us]",
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            Container(
              width: double.infinity,
              height: 40.00,
              padding: EdgeInsets.only(left: 8.00, right: 8.00),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      nomeMoeda1.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      nomeMoeda2.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      nomeMoeda3.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            _Resultados(16, dadosMercado1.tempoRetorno, dadosMercado2.tempoRetorno, dadosMercado3.tempoRetorno),
            const Text(
              "Médias [us]",
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 40.00,
            //   padding: EdgeInsets.only(left: 8.00, right: 8.00),
            //   child: Card(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           nomeMoeda1.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda2.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda3.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            _Resultados(16, dadosMercado1.tempoMedia, dadosMercado2.tempoMedia, dadosMercado3.tempoMedia),
            const Text(
              "Variâncias [us]",
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 40.00,
            //   padding: EdgeInsets.only(left: 8.00, right: 8.00),
            //   child: Card(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           nomeMoeda1.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda2.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda3.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            _Resultados(16, dadosMercado1.tempoVariancia, dadosMercado2.tempoVariancia, dadosMercado3.tempoVariancia),
            const Text(
              "Desvios [us]",
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 40.00,
            //   padding: EdgeInsets.only(left: 8.00, right: 8.00),
            //   child: Card(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           nomeMoeda1.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda2.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           nomeMoeda3.toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            _Resultados(16, dadosMercado1.tempoDesvio, dadosMercado2.tempoDesvio, dadosMercado3.tempoDesvio),
            ElevatedButton(
              onPressed: () => _showMenuData(context),
              child: const Text('Menu de Arquivo CSV'),
            ),
          ],
        ),
      ),

    );
  }
}

void _showMenuData(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => MenuData(),
  ));
}


class _Resultados extends StatelessWidget {

  final double tamanho;
  final Duration dado1;
  final Duration dado2;
  final Duration dado3;

  const _Resultados(this.tamanho, this.dado1, this.dado2, this.dado3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      padding: EdgeInsets.only(left: 8.00, right: 8.00, top: 8.00),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${dado1.inMicroseconds}",
              style: TextStyle(fontSize: tamanho),
            ),
            Text(
              "${dado2.inMicroseconds}",
              style: TextStyle(fontSize: tamanho),
            ),
            Text(
              "${dado3.inMicroseconds}",
              style: TextStyle(fontSize: tamanho),
            ),
          ],
        ),
      ),
    );
  }
}
