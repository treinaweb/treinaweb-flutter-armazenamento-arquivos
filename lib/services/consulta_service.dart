
import 'dart:convert';

import 'package:lifepet_app/models/consulta_model.dart';
import 'package:lifepet_app/utils/file_util.dart';

class ConsultaService {
  List<Consulta> _consultaList = [];
  List<Consulta> _consultaPet = [];

  void addConsulta(Consulta consulta) {
    FileUtil.insertData('consulta', consulta.toJson());
  }

  Future<List> getConsultasPet(String id) async {
    final dataList = await FileUtil.getData('consulta');
    _consultaList = dataList.map((consultas) => Consulta.fromJson(
      jsonDecode(consultas)
    )).toList();
    _consultaPet = _consultaList.where((consulta) => consulta.pet == id).toList();
    return _consultaPet;
  }

}