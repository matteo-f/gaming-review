require 'rails_helper'

RSpec.describe 'SignUp and write a review', type: :feature do
    
  User.delete_all
  
  
    scenario 'Create a new User and write a review' do
      visit new_user_path   
      fill_in 'user_username', with: 'bob'
      fill_in 'user_email', with:'d@gmail.com'
      fill_in 'user_password', with: '12345678'
      click_on 'Create User'
      click_on 'Write a new review'
      fill_in 'review_game_name', with: 'test'
      fill_in 'review_title', with:'Test Recensione'
      fill_in 'review_content', with:'Bel gioco,sono un test automatizzato'
      fill_in 'review_score', with: '100'
      click_on 'Create Review'
     
      expect(page).to have_content('Test Recensione')
     
    end
  end