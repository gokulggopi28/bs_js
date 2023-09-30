import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/record.dart';
class RecordsController{

  Future<List<Records>> getData() async {
    String rawData = await rootBundle.loadString("assets/data/records .json");
    List<dynamic> decodedData = jsonDecode(rawData);
   List<Records> records =
   decodedData.map((item) => Records.fromJSON(item)).toList();

   return records;
  }
}