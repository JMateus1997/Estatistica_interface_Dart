import 'package:estatistica_interface/Classes/DadosMercado.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes/ListaMercado.dart';

class TabelaRetornos extends StatefulWidget {

  DadosMercado dadosMercado1 = DadosMercado();
  DadosMercado dadosMercado2 = DadosMercado();
  DadosMercado dadosMercado3 = DadosMercado();

  String nomeMoeda1;
  String nomeMoeda2;
  String nomeMoeda3;


  TabelaRetornos(this.dadosMercado1,
      this.dadosMercado2,
      this.dadosMercado3,
      this.nomeMoeda1,
      this.nomeMoeda2,
      this.nomeMoeda3);

  @override
  State<TabelaRetornos> createState() => _TabelaRetornosState();
}

class _TabelaRetornosState extends State<TabelaRetornos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabela de Retornos'),
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
          "Tabela de Retornos:",
          style: TextStyle(fontSize: 24, color: Colors.red),
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
                  widget.nomeMoeda1.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  widget.nomeMoeda2.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  widget.nomeMoeda3.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
            Container(
              width: double.infinity,
              height: 400.0,
              child: ListView.builder(
                  itemBuilder: (context, index){
                    final double retorno1 = widget.dadosMercado1.retorno[index];
                    final double retorno2 = widget.dadosMercado2.retorno[index];
                    final double retorno3 = widget.dadosMercado3.retorno[index];
                    return _RetornoItem(retorno1, retorno2, retorno3);
                  },
                itemCount: widget.dadosMercado1.retorno.length,
              )
            ),
      ]),
    ),
    );


  }
}

class _RetornoItem extends StatelessWidget {
  final double retornoMoeda1;
  final double retornoMoeda2;
  final double retornoMoeda3;

  _RetornoItem(this.retornoMoeda1,
      this.retornoMoeda2,
      this.retornoMoeda3,);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              retornoMoeda1.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              retornoMoeda2.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              retornoMoeda3.toStringAsFixed(4),
              style: TextStyle(fontSize: 24),
            ),
          ],
        )
    );
  }

}
