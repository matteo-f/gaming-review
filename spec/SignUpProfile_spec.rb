require 'rails_helper'

RSpec.describe 'SignUp and see your profile', type: :feature do
    
  User.delete_all
  
  
    scenario 'new User + see your profile' do
      visit new_user_path   
      fill_in 'user_username', with: 'boboa'
      fill_in 'user_email', with:'doi@gmail.com'
      fill_in 'user_password', with: '12345678'
      click_on 'Create User'
      click_on 'View your profile'
      
      expect(page).to have_content('boboa Page')
     
    end
  end