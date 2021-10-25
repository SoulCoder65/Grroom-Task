import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Models/characters_model.dart'as ch;
class ApiService {
  Dio dio = Dio();
  final String url = "https://rickandmortyapi.com/api/character";

//  Fetch Characters List
  fetch_char_list() async {
    try {
     Response res= await dio.get(url);
     return ch.Characters.fromJson(jsonDecode(res.toString()));
    } catch (e) {
      print(e);
    }
  }
}
