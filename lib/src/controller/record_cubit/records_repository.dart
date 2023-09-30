import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RecordsRepository {
  Future <List<dynamic>?> getData() async {
    try {
      String rawData = await rootBundle.loadString("assets/data/records .json");
      List<dynamic> decodedData = jsonDecode(rawData);
      return decodedData;
    } catch (ex) {
      return null;
    }
  }
}
