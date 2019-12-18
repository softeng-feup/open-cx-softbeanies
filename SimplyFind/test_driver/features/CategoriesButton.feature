Tags: Lectures
Feature: Lectures button functionality
    
Scenario:
    Given I am a user
    When I tap the "Categories" button "1" time      #goes to the Options Menu
    And When I tap the " Lectures" button "1" time   #goes to the EventsMenu with a tag with the same name
    Then I expect the "Lectures" Menu to be display