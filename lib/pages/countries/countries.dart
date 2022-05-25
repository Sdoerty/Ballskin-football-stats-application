import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    apiClient.getResponseCountries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, index){
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        color: Color.fromRGBO(28, 27, 31, 1),
                        child: ListTile(
                          leading: Text("img"),
                          title: Text("${snapshot.data["response"]["name"].toString()}"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    }),
              );
            }else{
              return Center(
                child: Text('Нет данных'),
              );
            }
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
        );
  }
}
