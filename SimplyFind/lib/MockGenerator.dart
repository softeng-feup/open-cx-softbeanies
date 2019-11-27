import 'POI/Event.dart';

class MockGenerator {
  static final _mockGenerator = MockGenerator._internal();
  factory MockGenerator() {
    return _mockGenerator;
  }

  MockGenerator._internal();

  static List<Event> Workshops = [  new Event("Turning Your Phone Off and On - IT support hands-on", "My Name is Jeff", "B003", 1, "It works 99.9% of the times", null),
                                    new Event("How To Tackle The Semester With AGILEty", "Ademar Aguiar", "B206", 2, "You will learn it all by yourself, i promise it!", null),
                                    new Event("Flutter Apps - The Real Deal", "Helena Ferreira", "B107", 3, "I will teach you everything you didn't learn at class.", null),
                                    new Event("Practical Practices", "Todd Toddler","B207", 4, "Doing the doable",null)];

  static List<Event> Lectures = [ new Event("5G-The Future of Telecommunications", "Maria Josefina", "B201", 5, "5G is super cool", null),
                                  new Event("Quantum Computing 101", "Ademar Aguiar", "B204", 6, "So is the cat dead or alive? Now you can find out :)", null),
                                  new Event("Simplyfind app", "Helena Ferreira", "B306", 7, "Simplyfind is the best app ever", null),
                                  new Event("Theory of theorics", "Matt Matthews","B315", 8, "Explaining the explainable explanation", null)];
}