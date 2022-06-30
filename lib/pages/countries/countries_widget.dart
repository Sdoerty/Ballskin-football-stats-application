import 'package:ballskin/api/service.dart';
import 'package:ballskin/pages/leagues/leagues_widget.dart';
import 'package:ballskin/style/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesWidget extends StatefulWidget {
  const CountriesWidget({Key? key}) : super(key: key);

  @override
  State<CountriesWidget> createState() => _CountriesState();
}

class _CountriesState extends State<CountriesWidget> {
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    apiClient.fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiClient.fetchCountries(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LegauesWidget(countryId: snapshot.data[index]["id"], countryName: snapshot.data[index]["name"],))),
                        child: Card(
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
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 40,
                                    child: CachedNetworkImage(
                                      imageUrl: "https://livescore-api.com/api-client/countries/flag.json?&key=o77eB07ZqirxyShu&secret=f8bK5NOObpYQn23Lab0Lc7LCpcaY5rsl&country_id=${snapshot.data[index]["id"]}",
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                      errorWidget: (context, url, error) => Image.asset('images/no_flag.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text("${snapshot.data[index]["name"]}", style: countriesStyle(),)),
                                ],
                              ),
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
