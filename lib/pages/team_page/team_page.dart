import 'package:ballskin/api/service.dart';
import 'package:ballskin/pages/team_page/team_standings/team_standings_widget.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class TeamPageWidget extends StatefulWidget {
  const TeamPageWidget(
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
  State<TeamPageWidget> createState() => _TeamPageWidgetState();
}

class _TeamPageWidgetState extends State<TeamPageWidget> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
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
            bottom: TabBar(
                indicatorColor: Color.fromRGBO(56, 30, 114, 1),
                tabs: [
                  Tab(
                    child: Text('Расписание'),
                  ),
                  Tab(
                    child: Text('Таблицы'),
                  ),
                  Tab(
                    child: Text('Бомбардиры'),
                  )
                ]),
          ),
          body: TabBarView(
            children: [
              Text('aaa'),// Временно
              TeamStandingWidget(competition_id: widget.competition_id, competition_name: widget.competition_name, season_id: widget.season_id, season_name: widget.season_name),// Временно
              Text('Сейчас'),
            ],
          ),
        ));
  }
}
