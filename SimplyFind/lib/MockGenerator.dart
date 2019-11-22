import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'POI/Event.dart';

class MockGenerator {
  static final _mockGenerator = MockGenerator._internal();
  factory MockGenerator() {
    return _mockGenerator;
  }

  MockGenerator._internal();

  static List<Event> Workshops = [  new Event("Turning Your Phone Off and On - IT support hands-on", "My Name is Jeff", "B003", "It works 99.9% of the times", null, 1, LatLng(41.177672,-8.595620), 0),
                                    new Event("How To Tackle The Semester With AGILEty", "Ademar Aguiar", "B206", "You will learn it all by yourself, i promise it!", null, 2, LatLng(41.177374,-8.595221), 2),
                                    new Event("Flutter Apps - The Real Deal", "Helena Ferreira", "B107", "I will teach you everything you didn't learn at class.", null, 3, LatLng(41.177429,-8.595568), 1),
                                    new Event("Practical Practices", "Todd Toddler","B207","Doing the doable",null, 4, LatLng(41.177439,-8.595524),2)];

  static List<Event> Lectures = [ new Event("5G-The Future of Telecommunications", "Maria Josefina", "B201", "5G is super cool", null, 5, LatLng(41.177349,-8.595132), 2),
                                  new Event("Quantum Computing 101", "Ademar Aguiar", "B204", "So is the cat dead or alive? Now you can find out :)", null, 6, LatLng(41.177251,-8.595167), 2),
                                  new Event("Simplyfind app", "Helena Ferreira", "B306", "Simplyfind is the best app ever", null, 7, LatLng(41.177334,-8.595263), 3),
                                  new Event("Theory of theorics", "Matt Matthews","B315","Explaining the explainable explanation", null, 8, LatLng(41.17752,-8.595953),3)];
}