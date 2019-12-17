Feature: Path Finding
    A path should be built when the InfoWindow of a map Marker is pressed

    Scenario: Path is built when InfoWindow of Marker is pressed
        Given I am located in the building's "main entrance"
        When I tap the "Map Marker's InfoWindow"
        Then I expect a path to be built from the "main entrance" to the "Map Marker's location"
