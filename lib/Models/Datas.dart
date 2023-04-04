import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {
  String? id;
  String? name;

  Data({
    required this.id,
    required this.name,
  });
}

class Datas with ChangeNotifier {
  final List<Data> _dietLabelList = [];
  final List<Data> _healthLabelList = [];
  final List<Data> _cuisineTypeList = [];
  final List<Data> _dishTypeList = [];
  final List<Data> _ingredientsList = [];
  String? name;
  bool loaded = false;

  Future<void> fetchData() async {
    if (loaded) return;
    final response = await http
        .get(Uri.parse('https://recipiefilter.pythonanywhere.com/index'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      (jsonData["dietLabels"]).forEach((key, value) {
        _dietLabelList.add(Data(id: key, name: value));
      });
      (jsonData["hl"]).forEach((key, value) {
        _healthLabelList.add(Data(id: key, name: value));
      });
      (jsonData["ctype"]).forEach((key, value) {
        _cuisineTypeList.add(Data(id: key, name: value));
      });
      (jsonData["dishType"]).forEach((key, value) {
        _dishTypeList.add(Data(id: key, name: value));
      });
      (jsonData["ingredients"]).forEach((key, value) {
        _ingredientsList.add(Data(id: key, name: value));
      });

      loaded = true;
      notifyListeners();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<List<Data>> get cuisines async {
    return _cuisineTypeList;
  }

  List<Data> get healthLabels {
    return _healthLabelList;
  }

  List<Data> get dishTypes {
    return _dishTypeList;
  }

  List<Data> get ingredients {
    return _ingredientsList;
  }

  List<String> get ingredientsName {
    List<String> list = [];
    for (var item in _ingredientsList) {
      list.add(item.name!);
    }
    return list;
  }

  List<Data> get dietLabels {
    return _dietLabelList;
  }

  bool get isLoading {
    return !loaded;
  }
}
