
#require "rails_helper"

Given("I am on the /login page") do
  visit signin_path
end

When("I fill in username with a") do
  fill_in 'username', with: 'a'
end

When("I fill in password with aaaaaa") do
  fill_in 'password', with: '12345678'
end


When ("I press Sign in") do 
  click_on 'Sign In'
end

Then("I see the homepage") do
  expect(page).to have_content('Game Review Account')
end


Given("I am on the /registration page") do
  visit new_user_path 
end

When("I fill in username with JOJO") do
  fill_in 'user_username', with: 'JOJO'
end

When("I fill in email with DIO@gmail.com") do
  fill_in 'user_email', with:'DIO@gmail.com'
end

When("I fill in password with 12345678") do
  fill_in 'user_password', with: '12345678'
end

When ("I press create user") do 
  click_on 'Create User'
end

When ("I press View your profile") do 
  click_on 'View your profile'
end

Then("I see my profile") do
  expect(page).to have_content('JOJO Page')
end
