Feature: Search Page
    The Conference map should be seen with its events when the Search button is pressed

    Scenario: The conference map is built when the Search button is pressed
         Given I opened the application
         When I tap the "Search" button
         Then I expect a map of the conference to be displayed

    Scenario: The conference map is composed of markers regarding events and other POIs
        Given I opened the "Search Page"
        When I look at the Map
        Then I expect the map to be populated with "POIs"
