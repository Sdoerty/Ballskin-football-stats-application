import 'package:ballskin/api/service.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

import '../fixtures/selected_team_fixtures.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 0, left: 0, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 25,
                child: Text(
                  "M",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 25,
                child: Text(
                  "W",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 25,
                child: Text(
                  "D",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 25,
                child: Text(
                  "L",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 45,
                child: Text(
                  "GS-GC",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 27,
                child: Text(
                  "GD",
                  style: teamsStyle(),
                ),
              ),
              Container(
                width: 25,
                child: Text(
                  "P",
                  style: teamsStyle(),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: FutureBuilder(
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
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["rank"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SelectedTeamFixturesWidget(
                                                                competition_id:
                                                                widget.competition_id,
                                                                team: snapshot.data[index]
                                                                ["team_id"],
                                                                team_name:
                                                                snapshot.data[index]
                                                                ["name"]))),
                                                child: Container(
                                                  width: 100,
                                                  child: Text(
                                                    "${snapshot.data[index]["name"]}",
                                                    overflow: TextOverflow.clip,
                                                    style: teamsStyle(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["matches"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["won"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["drawn"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["lost"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 45,
                                                child: Text(
                                                  "${snapshot.data[index]["goals_scored"]}-${snapshot.data[index]["goals_conceded"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["goal_diff"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                              Container(
                                                width: 25,
                                                child: Text(
                                                  "${snapshot.data[index]["points"]}",
                                                  style: teamsStyle(),
                                                ),
                                              ),
                                            ],
                                          )
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
              }),
        ),
      ],
    );
  }
}
