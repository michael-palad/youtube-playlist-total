class PagesController < ApplicationController
  def index
    @playlist = YtPlaylist.new
  end
  
  def playlist_total
    @playlist = YtPlaylist.new(yt_playlist_params)
    if @playlist.process_playlist
      render :playlist_total  
    else
      render :index  
    end
  end
  
  private
  
  def yt_playlist_params
    params.require(:yt_playlist).permit(:url)      
  end
end
