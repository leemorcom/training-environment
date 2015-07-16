@1	
Feature: This is to login and use the form



Scenario: I will complete all fields

Given I create a user and I login
When I fill in all the fields and submit
Then I get confirmation of those details