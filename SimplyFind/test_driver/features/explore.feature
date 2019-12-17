Feature: Search Page
    The Conference map should be seen with its events when the Search button is pressed

    Scenario: The conference map is built when the Search button is pressed
         Given I opened the application
         When I tap the Explore button 1 time
         Then I expect a map of the conference to be displayed
