import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class TeamsWidget extends StatefulWidget {
  const TeamsWidget(
      {Key? key, required this.leagueId, required this.leagueName})
      : super(key: key);

  final int leagueId;
  final String leagueName;

  @override
  State<TeamsWidget> createState() => _CountriesState();
}

class _CountriesState extends State<TeamsWidget> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    apiClient.getTeamsByCountry(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiClient.getTeamsByCountry(widget.leagueId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(28, 27, 31, 1),
                  title: Text('${widget.leagueName}'),
                  centerTitle: true,
                ),
                backgroundColor: Colors.black,
                body: Padding(
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
                                          "${snapshot.data[index].team.logo}"),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    child: Text(
                                  "${snapshot.data[index].team.name}",
                                  style: countriesStyle(),
                                ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
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
