import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class FixturesWidget extends StatefulWidget {
  const FixturesWidget(
      {Key? key,
        required this.competition_id,}) : super(key: key);

  final competition_id;

  @override
  State<FixturesWidget> createState() => _FixturesWidgetState();
}

class _FixturesWidgetState extends State<FixturesWidget> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    apiClient.fetchFixtures(widget.competition_id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiClient.fetchFixtures(widget.competition_id),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Round - ${snapshot.data[index]["round"]}",
                                      style: teamsStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${snapshot.data[index]["home_name"]}",
                                      style: subtitleStyle(),
                                    ),
                                    Text(
                                      "${snapshot.data[index]["away_name"]}",
                                      style: subtitleStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${snapshot.data[index]["date"]}",
                                          style: teamsStyle(),
                                        ),
                                        Text(
                                          "${snapshot.data[index]["time"]}",
                                          style: teamsStyle(),
                                        ),
                                        Text(
                                          "${snapshot.data[index]["location"]}",
                                          style: teamsStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
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
        });
  }
}
