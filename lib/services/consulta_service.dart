
import 'package:lifepet_app/models/consulta_model.dart';
import 'package:lifepet_app/utils/file_util.dart';

class ConsultaService {

  void addConsulta(Consulta consulta) {
    FileUtil.insertData('consulta', consulta.toJson());
  }

}