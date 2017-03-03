require 'rails_helper'

RSpec.describe YtPlaylist, type: :model do
  let(:playlist) { YtPlaylist.new }
    
  context 'validations' do
    it "invalidates a string that's not a URL" do
      playlist.url = "some string"
      expect(playlist).not_to be_valid
    end
    
    it "validates a string that's a URL" do
      playlist.url = "http://www.youtube.com"
      expect(playlist).to be_valid      
    end
  end
  
  describe '#process_playlist' do
    context "Invalid playlists" do
      it "returns false on a url that's not a playlist" do
        playlist.url = "http://www.youtube.com"
        expect(playlist.process_playlist).to be false
      end
    
      it "returns false on a url that's not within youtube" do
        playlist.url = "http://www.yahoo.com"
        expect(playlist.process_playlist).to be false
      end
    end
    
    context "Valid playlists" do
      before do
        # assuming the playlist below still exists on the time of testing
        playlist.url = "https://www.youtube.com/watch?v=WJlfVjGt6Hg&list=PL35523924E14AB12C"       
      end
        
      it "returns true on a valid youtube playlist url" do
        expect(playlist.process_playlist).to be true
      end
      
      it "assigns a title on valid playlist" do
        playlist.process_playlist
        expect(playlist.title).not_to be_nil
        expect(playlist.title).not_to be_blank
      end
      
      it "assigns an array to videos on a valid playlist" do
        playlist.process_playlist
        expect(playlist.videos).to be_an(Array)
        expect(playlist.videos).not_to be_empty
      end
      
      it "assigns a total_duration on a valid playlist" do
        playlist.process_playlist
        expect(playlist.total_duration).not_to be_nil
        expect(playlist.total_duration).not_to be_blank      
      end
    end  
    
  end
end
