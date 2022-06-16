import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LegauesWidget extends StatefulWidget {
  const LegauesWidget({Key? key}) : super(key: key);

  @override
  State<LegauesWidget> createState() => _CountriesState();
}

class _CountriesState extends State<LegauesWidget> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    apiClient.getLeagueByCountry();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiClient.getLeagueByCountry(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Color.fromRGBO(28, 27, 31, 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: 100,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.network(
                                        "${snapshot.data[index].league.logo}"),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Text(
                                "${snapshot.data[index].league.name}",
                                style: countriesStyle(),
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: Text('Нет данных'),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Icon(
                Icons.error,
                color: Colors.white,
              ),
            );
          }
        });
  }
}
