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
      try{
        final List parsedJson = jsonDecode(response.body)["data"]["country"];
        return parsedJson;
      }catch(e){
        return e;
      }
    }if(response.statusCode == 500) {
      throw Exception('500');
    }else{
      throw Exception('Exception');
    }
  }

  fetchLeagues(country_id) async{
    final url = Uri.parse('https://livescore-api.com/api-client/competitions/list.json&key=$_apiKey&secret=$_secretApiKey&country_id=$country_id');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final List parsedJson = jsonDecode(response.body)["data"]["competition"];
      return parsedJson;
    }else{
      throw Exception('Exception');
    }
  }

  fetchStandings(competition_id, season_id) async{
    final url = Uri.parse('https://livescore-api.com/api-client/leagues/table.json?competition_id=$competition_id&key=$_apiKey&secret=$_secretApiKey&season_id=$season_id');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final List parsedJson = jsonDecode(response.body)["data"]["table"];
      return parsedJson;
    }else{
      throw Exception('Exception');
    }
  }

  fetchFixtures(competition_id) async{
    final url = Uri.parse('https://livescore-api.com/api-client/fixtures/matches.json?&key=$_apiKey&secret=$_secretApiKey&competition_id=$competition_id');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final List parsedJson = jsonDecode(response.body)["data"]["fixtures"];
      return parsedJson;
    }else{
      throw Exception('Exception');
    }
  }

  fetchSelectedTeamFixtures(competition_id, team) async{
    final url = Uri.parse('https://livescore-api.com/api-client/fixtures/matches.json?&key=$_apiKey&secret=$_secretApiKey&competition_id=$competition_id&team=$team');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final List parsedJson = jsonDecode(response.body)["data"]["fixtures"];
      return parsedJson;
    }else{
      throw Exception('Exception');
    }
  }

}