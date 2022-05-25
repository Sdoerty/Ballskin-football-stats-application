import 'dart:convert';
import 'package:ballskin/pages/countries/model/countries_model.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  /*static const _host = "https://v3.football.api-sports.io";
  static const _apiKey = "613907032f09355e1df586b219657ec9";*/

  var headers = {
    'x-apisports-key': '613907032f09355e1df586b219657ec9',
  };
  getResponseCountries() async{
    final request = await http.Request('GET', Uri.parse('https://v1.basketball.api-sports.io/countries'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      /*Map<String, dynamic> data = jsonDecode(response.body);

      print(data['get']);*/

      final list = await jsonDecode(response.body)["response"].map((data) => CountriesModel.fromJson(data)).toList();
      print(list);
      // TODO PRINT LIST BY KEYNAME

    }
    else {
      throw Exception('Exception!!!!!');
    }

  }
}