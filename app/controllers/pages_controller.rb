class PagesController < ApplicationController
  def index
    @yt_playlist = YtPlaylist.new
  end
  
  def playlist_total
    @yt_playlist = YtPlaylist.new(yt_playlist_params)
    if @yt_playlist.process_playlist
        
    else
      render :index  
    end
  end
  
  private
  
  def yt_playlist_params
    params.require(:yt_playlist).permit(:url)      
  end
end
