Tags: Wc, WcMenu
Feature: Wc button 
    Confirm Wc button correct  functionality
    
Scenario:
    # All user are the same so Given is not necessary
    When I tap the "Categories" button "1" time
    When I tap the "Wc" button "1" time
    Then I expect the "Wc" Menu to be display