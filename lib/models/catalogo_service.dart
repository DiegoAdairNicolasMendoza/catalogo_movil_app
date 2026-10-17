import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'item_model.dart';

class CatalogoService {
  static Future<List<ItemModel>> cargarCatalogo() async {
    final String response = await rootBundle.loadString(
      'assets/catalogo_datos.json',
    );
    final List<dynamic> data = json.decode(response);

    return data.map((jsonItem) => ItemModel.fromJson(jsonItem)).toList();
  }
}
