import 'dart:core';
import 'dart:math';

import '../Classes/DadosMercado.dart';
import '../Classes/ListaMercado.dart';


Stopwatch tempoRetorno = Stopwatch();
Stopwatch tempoMedia = Stopwatch();
Stopwatch tempoVariancia = Stopwatch();
Stopwatch tempoDesvio = Stopwatch();

DadosMercado estatistica(ListaMercado listaMercado){

  DadosMercado dadosMercado = DadosMercado();


  List<double> listaRetornoMoeda = calculaRetorno(listaMercado.precoMoeda.length, listaMercado.precoMoeda);
  dadosMercado.tempoRetorno = tempoRetorno.elapsed;

  double mediaRetornoMoeda = average(listaRetornoMoeda);
  dadosMercado.tempoMedia = tempoMedia.elapsed;

  double varianciaMoeda = calculaVariancia(listaMercado.precoMoeda.length, listaMercado.precoMoeda, mediaRetornoMoeda);
  dadosMercado.tempoVariancia = tempoVariancia.elapsed;

  tempoDesvio = new Stopwatch();
  tempoDesvio..start();
  double desvioMoeda = sqrt(varianciaMoeda);
  dadosMercado.tempoDesvio = tempoDesvio.elapsed;

  dadosMercado.moedaNome = listaMercado.nome;
  dadosMercado.retorno = listaRetornoMoeda;
  dadosMercado.media = mediaRetornoMoeda;
  dadosMercado.variancia = varianciaMoeda;
  dadosMercado.desvio = desvioMoeda;

  return(dadosMercado);
}

List<double> calculaRetorno(int tamanhoListaMoeda, List listaMercado){

  tempoRetorno = new Stopwatch();
  tempoRetorno..start();

  int moedaSize = tamanhoListaMoeda;
  double calculoRetornoMoeda;
  List<double> listaCalculoRetornoMoeda = [];

  for (int i = 0; i < (moedaSize - 1); i++){

    calculoRetornoMoeda = (listaMercado[i+1] - listaMercado[i])/(listaMercado[i]);
    listaCalculoRetornoMoeda.add(calculoRetornoMoeda);

  }

  return(listaCalculoRetornoMoeda);

}

double average(List listaRetornoMoeda){

  tempoMedia = new Stopwatch();

  tempoMedia..start();
  double sum = 0.0;
  for (int i = 0; i < (listaRetornoMoeda.length); i++){
    sum += listaRetornoMoeda[i];
  }
  double media = sum/listaRetornoMoeda.length;

  return(media);

}

double calculaVariancia(int tamanhoLista, List listaMercado, double media){

  tempoVariancia = new Stopwatch();

  tempoVariancia..start();
  double calculoVariancia = 0.0;

  for (int i = 0; i < (tamanhoLista); i++){
    calculoVariancia += pow((listaMercado[i] - media), 2);
  }
  calculoVariancia = calculoVariancia/(tamanhoLista - 1);

  return(calculoVariancia);

}

