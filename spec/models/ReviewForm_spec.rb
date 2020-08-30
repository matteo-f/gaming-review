require 'rails_helper'


RSpec.describe Review, :type => :model do
    
    Review.delete_all
    m3 = User.create(:username =>'boboaa',:email =>'boboaa@gmail.com', :password =>'12345678')
    m3.save!
  
   describe "Create review " do
        it "should be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:user_id=>'1',:game_id=>'1',:title =>'titolo review', :content =>'bla bla bla', :score =>'66', :game_name =>'D&D',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
            
            expect(review).to be_valid
        end
    end

    describe "Create review without score" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:game_id=>'1',:title =>'titolo review', :content =>'bla bla bla', :score =>'', :game_name =>'D&D',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end

    describe "Create review without content" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:game_id=>'1',:title =>'titolo review', :content =>'', :score =>'66', :game_name =>'WarHammer40K',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end

    describe "Create review without title" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:game_id=>'1',:title =>'', :content =>'WHAAAAGZ', :score =>'66', :game_name =>'WarHammer40K',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end

    describe "Create review without game name" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:game_id=>'1',:title =>'title', :content =>'WHAAAAGZ', :score =>'66', :game_name =>'',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end

    describe "Create review with a score >100" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>m3.id,:game_id=>'1',:title =>'title', :content =>'WHAAAAGZ', :score =>'101', :game_name =>'WarHammer40K',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end

    describe "Create review without user" do
        it "shouldn't be permitted" do
            m3 = User.new(:id => '1',:username =>'bobaoaa',:email =>'bobaoaa@gmail.com', :password =>'12345678')
            m3.save!
          
            review = Review.new(:id=>'',:game_id=>'1',:title =>'', :content =>'WHAAAAGZ', :score =>'66', :game_name =>'WarHammer40K',:created_at =>'1/1/1998',:updated_at =>'1/1/1998')
          expect(review).not_to be_valid
        end
    end
end
    