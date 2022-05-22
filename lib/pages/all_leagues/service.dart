import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

Future<List<User>> fetchData() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if(response.statusCode == 200){
    List parserJson = jsonDecode(response.body);
    List list = parserJson.map((e) => User.fromJson(e)).toList();
    return list as List<User>;
  }else{
    throw Exception('Error, status code = ${response.statusCode}');
  }
}