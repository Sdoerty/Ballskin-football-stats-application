import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';
import 'pages/countries/countries_widget.dart';
import 'pages/leagues/leagues_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(28, 27, 31, 1),
            title: appBarListTile(),
            centerTitle: true,
            bottom: TabBar(
                indicatorColor: Color.fromRGBO(56, 30, 114, 1),
                tabs: [
              Tab(
                child: Text('Все страны'),
              ),
              Tab(
                child: Text('Сегодня'),
              ),
              Tab(
                child: Text('Сейчас'),
              )
            ]),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(
            children: [
              CountriesWidget(),
              LegauesWidget(), // Временно
              Text('Сейчас'),
            ],
          ),
        ));
  }
}
