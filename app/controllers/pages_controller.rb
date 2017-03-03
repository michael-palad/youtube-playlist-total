class PagesController < ApplicationController
  def index
    @yt_playlist = YtPlaylist.new
  end
  
  def playlist_total
    url = yt_playlist_params[:url]
    
  end
  
  private
  
  def yt_playlist_params
    params.require(:yt_playlist).permit(:url)      
  end
end
