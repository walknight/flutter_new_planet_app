import 'package:flutter/material.dart';
import '../config/text_style.dart';
import '../model/planet.dart';

class DetailPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Planet args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        //buat appbar gradient
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF),
              const Color(0xFF00CCFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
      ),
      body: Container(
        color: const Color(0xFF736AB7),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            _getBackground(args),
            _getGradient(),
            _getContent(args),
          ],
        ),
      ),
    );
  }
}

Widget _getBackground(Planet planet) {
  return Container(
    child: Image.network(
      planet.picture,
      fit: BoxFit.cover,
      height: 300,
    ),
    constraints: BoxConstraints.expand(
      height: 300,
    ),
  );
}

Widget _getGradient() {
  return Container(
    margin: const EdgeInsets.only(top: 190),
    height: 110,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color(0x00736AB7),
        Color(0xFF736AB7),
      ],
      stops: [0.0, 0.9],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.0, 1.0),
    )),
  );
}

Widget _getContent(Planet planet) {
  final _overViewTitle = "Overview".toUpperCase();

  return ListView(
    padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 72.0),
                  height: 154.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF333366),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 10))
                      ]),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 42, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          planet.name,
                          style: Style.titleTextStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          planet.location,
                          style: Style.commonTextStyle,
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 2,
                          indent: 130,
                          endIndent: 130,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    planet.distance,
                                    style: Style.regularTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    planet.gravity,
                                    style: Style.regularTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  alignment: FractionalOffset.center,
                  child: Hero(
                    tag: "planet-hero-${planet.id}",
                    child: Image(
                      image: AssetImage(planet.image),
                      height: 92.0,
                      width: 92.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              _overViewTitle,
              style: Style.headerTextStyle,
            ),
            Divider(
              color: Colors.blue,
              thickness: 4,
              endIndent: 300,
            ),
            Text(
              planet.description,
              style: Style.commonTextStyle,
            )
          ],
        ),
      )
    ],
  );
}
