import 'package:flutter/material.dart';
import 'package:prototype/src/screens/Widgets/OptionButton.dart';
import '../../../MockGenerator.dart';
import '../../../POI/Event.dart';
import '../AppBarCostumize.dart';
import 'ShowDescriptionMenu.dart';

/* Events Menu is used for display of workshops and lectures */
class EventsMenu extends StatelessWidget {
  final BuildContext context;
  final String title;
  String nextMenu, backMenu;
  List<Event> events;
  EventsMenu({this.context, @required this.title });

  @override
  Widget build(BuildContext context) {
    if(title == "Lectures"){
      backMenu = '/Lectures';
      events = MockGenerator.Lectures; //get lectures appening next
    }      
    else {
      backMenu = '/Workshops';
      events = MockGenerator.Workshops; //get Workshops appening next
    }
    var numberOfevents = events.length;

    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: title, backMenu: '/Options',),
      body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
            if(numberOfevents == 0)
             new Padding(
              padding: EdgeInsets.only(top:(35 / 100) * MediaQuery.of(context).size.height,),
              child: new Text(
              "Sorry! There are no " + title + " available.", 
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 30.0, color: Color.fromRGBO(1, 38, 90, 1)),
              )
            ),
            for(int i= 0; i < numberOfevents; i++)
                OptionButton(
                  x: 10,
                  y: 5 + i * 20,
                  title:  events[i].name,
                  time: events[i].hour,
                  speaker: events[i].speaker,
                  room: events[i].room,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute( builder: (context) 
                      => ShowDescriptionMenu(title: title, backMenu: backMenu, event: events[i], ),
                    )); 
                  }),                 
            ],
          ),
        )
      )
    );
  }
}