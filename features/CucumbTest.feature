Feature: Cucumber Test
  1) As a registered user with the email a@gmail.com and password aaaaaa and username a I want to login 
  2) As a neo-registered user i visit my profile page


Scenario: Log In
	  Given  I am on the /login page
    When   I fill in username with a
    And    I fill in password with aaaaaa
    And    I press Sign in
    Then   I see the homepage





Scenario: Sign Up
  Given    I am on the /registration page
  When     I fill in username with JOJO
  And      I fill in email with DIO@gmail.com
  And      I fill in password with 12345678  
  And      I press create user
  And      I press View your profile
  Then     I see my profile

    