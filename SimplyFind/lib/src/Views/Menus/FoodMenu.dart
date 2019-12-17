import 'package:flutter/material.dart';
import 'package:simplyfind/src/Model-POI/Place.dart';
import '../../Controller/DataServer.dart';
import '../Widgets/ButtonOrange.dart';
import '../AppBarCostumize.dart';
import '../Search.dart';

class FoodMenu extends StatelessWidget {

  Future<Place> _coffeeLounge = DataServer().getCoffeeLounge();
  //Future<List<Place>> _vendingMachines = DataServer().getCoffeeMachines();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Place>(
        future: _coffeeLounge, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Place> snapshot) {
          List<Widget> children;

          if (snapshot.hasData) {
            children = <Widget>[
              ButtonOrange(
                  x: 10,
                  y: 47,
                  title: "Coffee Lounge",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            destination: "Coffee Lounge",
                            wantedPlaces: [
                              snapshot.data // THIS!!!
                            ],
                            origin: null,
                            location: "my location",
                          ),
                        ));
                  }),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 200,
                height: 200,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }

          return Scaffold(
              appBar: new MyCustomAppBar2(
                height: 14,
                context: context,
                title: "Food",
              ),
              body: SafeArea(
                child: new Container(
                  color: Colors.white,
                  child: Stack(children: children),
              )));
        });
  }
}
