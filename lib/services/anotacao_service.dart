import 'dart:math';
import 'package:lifepet_app/models/anotacao_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'dart:convert';


class AnotacaoService {
  Random random = new Random();
  List<Anotacao> _anotacaoList = [];
  List<Anotacao> _anotacaoPet = [];
  int indexRemover;


  void addAnotacao(Anotacao anotacao){
    FileUtil.insertData("anotacao", anotacao.toJson());
  }

  Future<List> getAnotacoesPet(String id) async {
    final dataList = await FileUtil.getData("anotacao");
    _anotacaoList = dataList.map((anotacaos) =>
        Anotacao.fromJson(jsonDecode(anotacaos))).toList();
    _anotacaoPet = _anotacaoList.where((anotacao) => anotacao.pet == id).toList();
    return _anotacaoPet;
  }

  Future<void> removeAnotacaoPet(String id) async {
    final dataList = await FileUtil.getData("anotacao");
    _anotacaoList = dataList.map((anotacaos) =>
        Anotacao.fromJson(jsonDecode(anotacaos))).toList();
    indexRemover = _anotacaoList.indexWhere((anotacao) => anotacao.id == id);
    FileUtil.removeData("anotacao", indexRemover);
  }


}