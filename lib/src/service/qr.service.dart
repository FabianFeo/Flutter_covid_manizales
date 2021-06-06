import 'dart:convert';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrService {
  Future<dynamic> pushData(Barcode data) async {
    print(String.fromCharCodes(data.rawBytes));
    return String.fromCharCodes(data.rawBytes);
  }
}
