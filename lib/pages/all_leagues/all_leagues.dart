import 'package:ballskin/pages/all_leagues/service.dart';
import 'package:ballskin/pages/all_leagues/user_model.dart';
import 'package:ballskin/style/style.dart';
import 'package:flutter/material.dart';

class AllLeagues extends StatefulWidget {
  const AllLeagues({Key? key}) : super(key: key);

  @override
  State<AllLeagues> createState() => _AllLeaguesState();
}

class _AllLeaguesState extends State<AllLeagues> {
  late final Future<List<User>> user;

  @override
  void initState() {
    super.initState();
    user = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: user,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index){
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        color: Color.fromRGBO(28, 27, 31, 1),
                        child: ListTile(
                          leading: Text("${snapshot.data[index].id}", style: defaultWhiteTextStyle(),),
                          title: Text("${snapshot.data[index].title}", style: defaultWhiteTextStyle(),),
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
