import 'package:estatistica_interface/Calculos/Estatistica.dart';
import 'package:estatistica_interface/screens/TabelaRetornos.dart';
import 'package:estatistica_interface/screens/TempoResultados.dart';
import 'package:flutter/material.dart';
import '../Classes/DadosMercado.dart';
import '../Classes/ListaMercado.dart';
import 'menu_data.dart';

class ResultadoDados extends StatefulWidget {

  ListaMercado listaMercado1 = ListaMercado();
  ListaMercado listaMercado2 = ListaMercado();
  ListaMercado listaMercado3 = ListaMercado();

  ResultadoDados(this.listaMercado1,
      this.listaMercado2,
      this.listaMercado3);

  @override
  State<ResultadoDados> createState() => _ResultadoDadosState();
}

class _ResultadoDadosState extends State<ResultadoDados> {

  DadosMercado dadosMercado1 = DadosMercado();
  DadosMercado dadosMercado2 = DadosMercado();
  DadosMercado dadosMercado3 = DadosMercado();

  @override
  Widget build(BuildContext context) {

    dadosMercado1 = estatistica(widget.listaMercado1);
    dadosMercado2 = estatistica(widget.listaMercado2);
    dadosMercado3 = estatistica(widget.listaMercado3);

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
                "Dados de Estatísticos:",
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
              const Text(
                "Médias",
                style: TextStyle(fontSize: 24, color: Colors.redAccent),
              ),
              Container(
                width: double.infinity,
                height: 64.00,
                padding: EdgeInsets.only(left: 8.00, right: 8.00),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.listaMercado1.nome.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        widget.listaMercado2.nome.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        widget.listaMercado3.nome.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              _Resultados(64, dadosMercado1.media, dadosMercado2.media, dadosMercado3.media),
              const Text(
                "Variâncias",
                style: TextStyle(fontSize: 24, color: Colors.redAccent),
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
              _Resultados(64, dadosMercado1.variancia, dadosMercado2.variancia, dadosMercado3.variancia),
              const Text(
                "Desvios",
                style: TextStyle(fontSize: 24, color: Colors.redAccent),
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
              _Resultados(64, dadosMercado1.desvio, dadosMercado2.desvio, dadosMercado3.desvio),
              ElevatedButton(
                onPressed: () => {_showTempoResultados(context)},
                child: const Text('Mostrar tempo de Cálculo'),
              ),
              ElevatedButton(
                onPressed: () => _showTabelaRetornos(context),
                child: const Text('Mostrar Tabela de Retornos'),
              ),
              ElevatedButton(
                onPressed: () => _showMenuData(context),
                child: const Text('Menu de Arquivo CSV'),
              ),
            ],
          ),
        ),

    );
  }
  
  void _showTabelaRetornos(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TabelaRetornos(dadosMercado1, dadosMercado2, dadosMercado3,
      widget.listaMercado1.nome, widget.listaMercado2.nome, widget.listaMercado3.nome),
    ));
  }

  void _showTempoResultados(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TempoResultados(dadosMercado1, dadosMercado2, dadosMercado3,
          widget.listaMercado1.nome, widget.listaMercado2.nome, widget.listaMercado3.nome),
    ));
  }

  void _showMenuData(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MenuData(),
    ));
  }
  
}




class _Resultados extends StatelessWidget {

  final double tamanho;
  final double dado1;
  final double dado2;
  final double dado3;

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
              dado1.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              dado2.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              dado3.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}






