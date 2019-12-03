import 'package:flutter/material.dart';
import '../../Controller/DataServer.dart';
import '../Widgets/OptionButton.dart';
import '../../Model-POI/Event.dart';
import '../AppBarCostumize.dart';
import 'ShowDescriptionMenu.dart';

/* Events Menu is used for display of workshops and lectures */
class EventsMenu extends StatelessWidget {
  final BuildContext context;
  final String title;
  String nextMenu;
  String currentDate =
      new DateTime.now().toString().substring(0, 10); //year-month-day
  String currentTime =
      new DateTime.now().toString().substring(11, 16); //hour:minutes
  List<Event> events;
  EventsMenu({this.context, @required this.title});

  @override
  Widget build(BuildContext context) {
    if (title == "Lectures") {
      events = DataServer().lectures; //get lectures appening next
    } else {
      events = DataServer().workshops; //get Workshops appening next
    }
    var numberOfEvents = events.length;

    return Scaffold(
        appBar: new MyCustomAppBar2(
          height: 14,
          context: context,
          title: title,
        ),
        body: SafeArea(
          child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              if (numberOfEvents == 0)
                new Padding(
                    padding: EdgeInsets.only(
                      top: (35 / 100) * MediaQuery.of(context).size.height,
                    ),
                    child: new Text(
                      "Sorry! There are no " + title + " available.",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: (10/ 100) * MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(1, 38, 90, 1)),
                    )),
              for (int i = 0; i < numberOfEvents; i++)
                if (
                  //event was a year greater than the current Date
                  int.parse(currentDate.substring(0, 4)) < int.parse(events[i].date.substring(6, 10)) ||
                  //event was a month greater than the current Date and year is the same
                    ((int.parse(currentDate.substring(0, 4)) == int.parse(events[i].date.substring(6, 10)) &&
                        (int.parse(currentDate.substring(5, 7)) < int.parse(events[i].date.substring(3, 5))))) ||
                    //event was day greater than the current Date and year and month are the same
                    (int.parse(currentDate.substring(0, 4)) ==
                                int.parse(events[i].date.substring(6, 10)) &&
                            (int.parse(currentDate.substring(5, 7)) ==
                                int.parse(events[i].date.substring(3, 5))) &&
                        (int.parse(currentDate.substring(8, 10)) <=
                            int.parse(events[i].date.substring(0, 2)))) ||
                  //event was hour + 15 minutes greater than the current hour and year, month and day are the same
                  (int.parse(currentDate.substring(0, 4)) ==
                                int.parse(events[i].date.substring(6, 10)) &&
                            (int.parse(currentDate.substring(5, 7)) ==
                                int.parse(events[i].date.substring(3, 5))) &&
                        (int.parse(currentDate.substring(8, 10)) ==
                            int.parse(events[i].date.substring(0, 2))) &&
                        (int.parse(currentTime.substring(0,2)) * 60 + (int.parse(currentTime.substring(4, 6)))) <
                          (int.parse(events[i].hour.substring(0,2))* 60 + int.parse(events[i].hour.substring(4,6)) + 15))   // 15 tolerance
                  )
                  OptionButton(
                      title: events[i].name,
                      time: events[i].hour,
                      speaker: events[i].speaker,
                      room: events[i].room,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowDescriptionMenu(
                                title: title,
                                event: events[i],
                              ),
                            ));
                      })
                 ,
            ],
          ),
        )));
  }
}
