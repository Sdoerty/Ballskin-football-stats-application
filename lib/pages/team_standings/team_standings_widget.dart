import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class TeamStandingWidget extends StatefulWidget {
  const TeamStandingWidget(
      {Key? key,
      required this.competition_id,
      required this.competition_name,
      required this.season_id,
      required this.season_name})
      : super(key: key);

  final competition_id;
  final competition_name;
  final season_id;
  final season_name;

  @override
  State<TeamStandingWidget> createState() => _CountriesState();
}

class _CountriesState extends State<TeamStandingWidget> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    widget.season_name;
    apiClient.fetchStandings(widget.competition_id, widget.season_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(28, 27, 31, 1),
          title: Column(
            children: [
              Text('${widget.competition_name}'),
              Text(
                '${widget.season_name}',
                style: subtitleStyle(),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: apiClient.fetchStandings(
                widget.competition_id, widget.season_id),
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
                            color: Color.fromRGBO(28, 27, 31, 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: ListTile(
                                        leading: Text(
                                          "${snapshot.data[index]["rank"]}",
                                          style: countriesStyle(),
                                        ),
                                        title: Text(
                                          "${snapshot.data[index]["name"]}",
                                          style: countriesStyle(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
            }));
  }
}
