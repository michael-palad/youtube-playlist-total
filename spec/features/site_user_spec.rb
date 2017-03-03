require 'rails_helper'

RSpec.feature "Site User", type: :feature do
  context "Proper URL" do
    let(:valid_playlist_url) { 
      "https://www.youtube.com/watch?v=WJlfVjGt6Hg&list=PL35523924E14AB12C" 
    }  
      
    scenario "User visits the home page" do
      visit "/"
      
      expect(page).to have_content("Youtube Playlist Total Duration Calculator")
    end
    
    scenario "User inputs a valid playlist url" do
      visit "/"
      fill_in "yt_playlist_url", with: valid_playlist_url
      click_button "Retrieve"
      
      expect(page).to have_content("Playlist Total")
      expect(page).to have_content("Video Title")
      expect(page).to have_content("Video Duration")
      expect(page).to have_content("Total Duration")
    end
  end
  
  context "Improper URL" do
    scenario "Users doesn't enter a url" do
      visit "/"
      click_button "Retrieve"
      
      expect(page).to have_content("Please enter a valid url")   
    end
      
    scenario "User inputs an invalid url" do
      visit "/"
      fill_in "yt_playlist_url", with: "Some Content"
      click_button "Retrieve"
      
      expect(page).to have_content("Please enter a valid url")
    end
    
    scenario "User inputs an invalid playlist url" do
      visit "/"
      fill_in "yt_playlist_url",
        with: "https://www.youtube.com/"
      click_button "Retrieve"
      
      expect(page).to have_content("Not a valid playlist url")    
    end
    
    scenario "User inputs an youtube playlist that doesn't exist" do
      visit "/"
      fill_in "yt_playlist_url",
        with: "https://www.youtube.com/watch?v=WJlfVjGt6Hg&list=PLTvOJydsdsdsdsdYuRB-MPSXgXZMxnfTfJNOdhGHuR"
      click_button "Retrieve"
      
      expect(page).to have_content("Error retrieving playlist data")
    end
  end
end