
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<File> getFile(String entidade) async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$entidade.json");
  }
}