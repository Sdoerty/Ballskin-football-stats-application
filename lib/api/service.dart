import 'dart:collection';
import 'dart:convert';
import 'package:ballskin/pages/countries/model/countries_model.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  static const _apiKey = "o77eB07ZqirxyShu";
  static const _secretApiKey = "f8bK5NOObpYQn23Lab0Lc7LCpcaY5rsl";

  fetchCountries() async{
    final url = Uri.parse('https://livescore-api.com/api-client/countries/list.json?&key=$_apiKey&secret=$_secretApiKey');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body)["data"]["country"];
      return parsedJson;
    }else{
      throw Exception('SHIT!!!');
    }
  }

  fetchLeagues(country_id) async{
    final url = Uri.parse('https://livescore-api.com/api-client/competitions/list.json&key=$_apiKey&secret=$_secretApiKey&country_id=$country_id');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body)["data"]["competition"];
      return parsedJson;
    }else{
      throw Exception('SHIT!!!');
    }
  }
}