import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'POI/Event.dart';

class MockGenerator {
  static final _mockGenerator = MockGenerator._internal();
  factory MockGenerator() {
    return _mockGenerator;
  }

  MockGenerator._internal();

  static List<Event> Workshops = [  new Event("Turning Your Phone Off and On - IT support hands-on", "My Name is Jeff", "B003","11-10-2019", "11:30", "It works 99.9% of the times", ["5G","Telecommunications"], 1, LatLng(41.177672,-8.595620), 0),
                                    new Event("How To Tackle The Semester With AGILEty", "Ademar Aguiar", "B206", "11-10-2019", "12:45" ,"You will learn it all by yourself, i promise it!", ["Computing","Physics"], 2, LatLng(41.177374,-8.595221), 2),
                                    new Event("Flutter Apps - The Real Deal", "Helena Ferreira", "B107", "11-10-2019", "17:30", "I will teach you everything you didn't learn at class.", null, 3, LatLng(41.177429,-8.595568), 1),
                                    new Event("Practical Practices", "Todd Toddler","B207", "11-10-2019", "10:30","Doing the doable",null, 4, LatLng(41.177439,-8.595524),2)];

  static List<Event> Lectures = [ new Event("5G - The Future of Telecommunications", "Maria Josefina", "B201", "11-10-2019", "10:15", "5G is super cool", ["5G","Telecommunications"], 5, LatLng(41.177349,-8.595132), 2),
                                  new Event("Quantum Computing 101", "Ademar Aguiar", "B204", "11-10-2019", "13:30", "So is the cat dead or alive? Now you can find out :)", ["Computing","Physics"], 6, LatLng(41.177251,-8.595167), 2),
                                  new Event("Simplyfind app", "Helena Ferreira", "B306", "11-10-2019", "16:30", "Simplyfind is the best app ever", ["World","Location"], 7, LatLng(41.177334,-8.595263), 3),
                                  new Event("Theory of theorics", "Matt Matthews","B315", "11-10-2019", "17:00","Explaining the explainable explanation", ["Computing","Physics"], 8, LatLng(41.17752,-8.595953),3)];
}