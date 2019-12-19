Tags: Lectures
Feature: Lecture button
    Confirm lectures button correct functionality
    
Scenario:
   # All user are the same so Given is not necessary
    When I tap the "Categories" button "1" time      #goes to the Options Menu
    And When I tap the " Lectures" button "1" time   #goes to the EventsMenu with a tag with the same name
    Then I expect the "Lectures" Menu to be display