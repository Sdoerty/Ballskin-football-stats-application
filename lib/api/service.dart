import 'dart:convert';
import 'package:ballskin/pages/countries/model/countries_model.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  /*static const _host = "https://v3.football.api-sports.io";
  static const _apiKey = "613907032f09355e1df586b219657ec9";*/
  // https://v3.football.api-sports.io/leagues?country=England&season=2021

  var headers = {
    'x-apisports-key': '613907032f09355e1df586b219657ec9',
  };

  var params = {
    'country' : 'England'
  };

  getResponseCountries() async{
    final request = await http.Request('GET', Uri.parse('https://v3.football.api-sports.io/countries'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body)['response'].map((data) => CountriesModel.fromJson(data)).toList();
      return list;
    }
    else {
      throw Exception('Exception!!!!!');
    }
  }

  getResponseLeagueByCountry() async{
    final request = await http.Request('GET', Uri.parse('https://v3.football.api-sports.io/leagues'));
    request.headers.addAll(headers);
    // request.bodyFields.addAll(params);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body)['response'].map((data) => CountriesModel.fromJson(data)).toList();
      print(list);
      return list;
    }
    else {
      throw Exception('Exception!!!!!');
    }
  }
}