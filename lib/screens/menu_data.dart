import 'dart:convert';
import 'dart:io';
import 'package:estatistica_interface/screens/Pre_visualizacaoDados.dart';
import 'package:flutter/services.dart'  show SystemUiOverlayStyle, rootBundle;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';


import '../Classes/ListaMercado.dart';



class MenuData extends StatefulWidget {
  const MenuData({Key? key}) : super(key: key);

  @override
  State<MenuData> createState() => _MenuDataState();
}

Stopwatch LeituraCSV = Stopwatch();
Duration tempoLeituraCSV = Duration();

class _MenuDataState extends State<MenuData> {

  String? filePath;

  ListaMercado listaMercado1 = ListaMercado();
  ListaMercado listaMercado2 = ListaMercado();
  ListaMercado listaMercado3 = ListaMercado();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Data'),
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Card(
              child: Text('teste de informação do que fazer nesta tela'),
            ),
            ElevatedButton(
              onPressed: () => _pickFile(),
              child: const Text('Carregar Arquivo CSV'),
            ),
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false,
        withReadStream: true, withData: false);

    LeituraCSV = new Stopwatch()..start();

    //se o arquivo não for escolhido
    if (result == null) return;

    filePath = await result.files.first.path!;

    var csvFile1 = File(filePath!).readAsLinesSync();

    print(csvFile1);

    organizaDados(csvFile1);

    print(listaMercado1.nome);
    print(listaMercado1.precoMoeda);

    print(listaMercado2.nome);
    print(listaMercado2.precoMoeda);

    print(listaMercado3.nome);
    print(listaMercado3.precoMoeda);

    print(tempoLeituraCSV.inMilliseconds);

    _showPre_visualizacaoDados(context);
  }

  organizaDados(List campos) {
    String cabecalho = campos[0];
    List<String> nomes = cabecalho.split(",");
    campos.removeAt(0);

    listaMercado1.nome = nomes[1];
    listaMercado2.nome = nomes[2];
    listaMercado3.nome = nomes[3];

    for (var i in campos) {
      final linhas = i.split(",");

      listaMercado1.precoMoeda.add(double.parse(linhas[1]));
      listaMercado2.precoMoeda.add(double.parse(linhas[2]));
      listaMercado3.precoMoeda.add(double.parse(linhas[3]));
    }
    tempoLeituraCSV = LeituraCSV.elapsed;
  }

  void _showPre_visualizacaoDados(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PreVisualizacaoDados(listaMercado1, listaMercado2, listaMercado3, tempoLeituraCSV),
    ));
  }
}






