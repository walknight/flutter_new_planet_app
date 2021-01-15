import 'package:flutter/material.dart';
import '../widget/planetcard.dart';
import '../model/planet.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'treva',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
        centerTitle: true,
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(),
      body: Container(
          color: Color(0xFF736AB7),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 24),
                sliver: SliverFixedExtentList(
                  itemExtent: 155,
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) => PlanetCard(planets[index]),
                    childCount: planets.length,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
