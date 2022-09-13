import 'dart:convert';
import 'dart:core';

// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:rest_food/view/models/platjson.dart';
import 'package:rest_food/view/models/produit_Card1.dart';
// import 'dart:developer';

class Api {
  static Future<List<Produitjson>> readdatajson() async {
    final jsondata = await rootBundle.rootBundle.loadString("assets/data.json");
    List<dynamic> datalist = jsonDecode(jsondata);
    return datalist.map((e) => Produitjson.fromJson(e)).toList();
    //data.map<Produitjson>((image) => Produitjson.fromJson(image)).toList();
  }

  static Future<List<PlatJson>> importdatajson() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("assets/produit.json");
    List<dynamic> datalist = jsonDecode(jsondata);
    return datalist.map((e) => PlatJson.fromJson(e)).toList();
    //data.map<Produitjson>((image) => Produitjson.fromJson(image)).toList();
  }
}
