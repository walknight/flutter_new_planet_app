import 'package:flutter/material.dart';
import '../config/text_style.dart';
import '../model/planet.dart';

class PlanetCard extends StatelessWidget {
  final Planet _planet;

  PlanetCard(this._planet);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail',
            arguments: Planet(
              id: this._planet.id,
              name: this._planet.name,
              description: this._planet.description,
              distance: this._planet.distance,
              gravity: this._planet.gravity,
              image: this._planet.image,
              location: this._planet.location,
              picture: this._planet.picture,
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 46),
              height: 124.0,
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
                margin: EdgeInsets.fromLTRB(70, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _planet.name,
                      style: Style.titleTextStyle,
                    ),
                    Text(
                      _planet.location,
                      style: Style.commonTextStyle,
                    ),
                    Divider(
                      color: Colors.blue,
                      thickness: 5,
                      endIndent: 200,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: Colors.grey,
                            ),
                            Text(
                              _planet.distance,
                              style: Style.regularTextStyle,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.upload_sharp,
                              color: Colors.grey,
                            ),
                            Text(
                              _planet.gravity,
                              style: Style.regularTextStyle,
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Hero(
                tag: "planet-hero-${_planet.id}",
                child: Image(
                  image: AssetImage(_planet.image),
                  height: 92.0,
                  width: 92.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
