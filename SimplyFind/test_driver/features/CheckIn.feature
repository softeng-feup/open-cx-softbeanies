Tags: CheckIn
Feature: CheckIn button
    Confirm CheckIn button correct functionality
    
Scenario:
   # All user are the same so Given is not necessary
    When I tap the "Categories" button "1" time      #goes to the Options Menu
    And When I tap the "CheckIn" button "1" time     #ask for the pad to the CheckIn from where I am
    Then I expect to see the map