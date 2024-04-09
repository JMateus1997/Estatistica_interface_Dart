
import 'package:estatistica_interface/screens/ResultadoDados.dart';
import 'package:flutter/material.dart';
import '../Classes/ListaMercado.dart';

class PreVisualizacaoDados extends StatefulWidget {

  ListaMercado listaMercado1 = ListaMercado();
  ListaMercado listaMercado2 = ListaMercado();
  ListaMercado listaMercado3 = ListaMercado();
  Duration tempoLeituraCSV = Duration();

  PreVisualizacaoDados(this.listaMercado1,
      this.listaMercado2,
      this.listaMercado3,
      this.tempoLeituraCSV);

  @override
  State<PreVisualizacaoDados> createState() => _PreVisualizacaoDadosState();
}


class _PreVisualizacaoDadosState extends State<PreVisualizacaoDados> {

  ListaMercado listaMercado1 = ListaMercado();
  ListaMercado listaMercado2 = ListaMercado();
  ListaMercado listaMercado3 = ListaMercado();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre-Visualização'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 520,
              padding: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  listaMercado1 = widget.listaMercado1;
                  listaMercado2 = widget.listaMercado2;
                  listaMercado3 = widget.listaMercado3;

                  _showResultadoDados(context);
                },
                child: const Text('Realizar Cálculo Estatístico'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 64.00,
              padding: EdgeInsets.all(8.00),
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
            Container(
              height: 320,
              width: double.infinity,
              padding: EdgeInsets.all(8.00),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final double precoMoeda1 = widget.listaMercado1.precoMoeda[index];
                  final double precoMoeda2 = widget.listaMercado2.precoMoeda[index];
                  final double precoMoeda3 = widget.listaMercado3.precoMoeda[index];
                  return _MoedaItem(precoMoeda1, precoMoeda2, precoMoeda3);
                },
                itemCount: widget.listaMercado1.precoMoeda.length,
              ),
            ),
            const Text(
              "Leitura do Arquivo CSV [ms]",
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            Container(
              width: double.infinity,
              height: 64.00,
              padding: EdgeInsets.all(8.00),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.tempoLeituraCSV.inMilliseconds.toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  void _showResultadoDados(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ResultadoDados(listaMercado1, listaMercado2, listaMercado3),
    ));
  }

}

class _MoedaItem extends StatelessWidget {
  final double precoMoeda1;
  final double precoMoeda2;
  final double precoMoeda3;

  _MoedaItem(
      this.precoMoeda1,
      this.precoMoeda2,
      this.precoMoeda3,
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            precoMoeda1.toStringAsFixed(4),
            style: TextStyle(fontSize: 24),
          ),
          Text(
            precoMoeda2.toStringAsFixed(4),
            style: TextStyle(fontSize: 24),
          ),
          Text(
            precoMoeda3.toStringAsFixed(4),
            style: TextStyle(fontSize: 24),
          ),
        ],
      )
    );
  }

}



