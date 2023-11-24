

import 'dart:io';

import 'package:airscaper/common/tools/abs_assets_reader.dart';

class TestAssetsReader extends AbsAssetsReader{

  Future<String> readAssetFile(String filename) async {
    var filePath = 'test/assets/$filename';
    var file = File(filePath);
    return  file.readAsString();
  }
}