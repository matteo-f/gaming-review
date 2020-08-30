require 'rails_helper'

RSpec.describe 'Login', type: :feature do
    
  User.delete_all
  Review.delete_all
  m2 = User.create(:username =>'bobo',:email =>'bobo@gmail.com', :password =>'12345678')
  m2.save!
  
    scenario 'Sign In' do
      visit signin_path   
      fill_in 'username', with: 'bobo'
      fill_in 'password', with: '12345678'
      click_on 'Sign In'
      expect(page).to have_content('Game Review Account')
      
    end
  end