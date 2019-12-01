import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'POI/Event.dart';
import 'POI/PointOfInterest.dart';

class MockGenerator {
  static final _mockGenerator = MockGenerator._internal();
  factory MockGenerator() {
    return _mockGenerator;
  }

  MockGenerator._internal();

  static List<Event> Workshops = [  new Event("Turning Your Phone Off and On - IT support hands-on", "My Name is Jeff", "B003", "14-04-2020", "12:30", 1, "It works 99.9% of the times", null),
                                    new Event("How To Tackle The Semester With AGILEty", "Ademar Aguiar", "B206","14-04-2020", "13:15", 2, "You will learn it all by yourself, i promise it!", null),
                                    new Event("Flutter Apps - The Real Deal", "Helena Ferreira", "B107", "14-04-2020", "12:30", 3, "I will teach you everything you didn't learn at class.", null),
                                    new Event("Practical Practices", "Todd Toddler","B207", "01-12-2019", "12:30", 4, "Doing the doable",null),
                                    new Event("Turning Your Phone Off and On - IT support hands-on", "My Name is Jeff", "B003", "14-04-2020", "12:30", 1, "It works 99.9% of the times", null),
                                    new Event("How To Tackle The Semester With AGILEty", "Ademar Aguiar", "B206","14-04-2020", "13:15", 2, "You will learn it all by yourself, i promise it!", null),
                                    new Event("Flutter Apps - The Real Deal", "Helena Ferreira", "B107", "01-12-2019", "16:15", 3, "I will teach you everything you didn't learn at class.", null),
                                    new Event("The true behind everything", "John Snow","B207", "12-12-2019", "12:30", 4, "Doing the doable",null)];

  static List<Event> Lectures = [ new Event("5G - The Future of Telecommunications", "Maria Josefina", "B201", "14-04-2020", "15:40", 5, "5G is super cool", null),
                                  new Event("Quantum Computing 101", "Ademar Aguiar", "B204", "14-04-2020", "16:30", 6, "So is the cat dead or alive? Now you can find out :)", null),
                                  new Event("Simplyfind app", "Helena Ferreira", "B306","14-04-2020", "17:15", 7, "Simplyfind is the best app ever", null),
                                  new Event("Theory of theorics", "Matt Matthews","B315", "01-12-2019", "16:14", 8, "Explaining the explainable explanation", null)];

  static List<PointOfInterest> LocationWorkshops = [  new PointOfInterest(1, LatLng(41.177672,-8.595620),0),
                                                      new PointOfInterest(2, LatLng(41.177374,-8.595221),2),
                                                      new PointOfInterest(3, LatLng(41.177429,-8.595568),1),
                                                      new PointOfInterest(4, LatLng(41.177439,-8.595524),2)];

  static List<PointOfInterest> LocationLectures = [   new PointOfInterest(5, LatLng(41.177349,-8.595132),2),
                                                      new PointOfInterest(6, LatLng(41.177251,-8.595167),2),
                                                      new PointOfInterest(7, LatLng(41.177334,-8.595263),3),
                                                      new PointOfInterest(8, LatLng(41.177334,-8.595263),3)];
}