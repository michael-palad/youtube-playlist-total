class YtPlaylist
  include ActiveModel::Model
  
  attr_accessor :url
  
  attr_reader :title
  attr_reader :videos
  attr_reader :total_duration
  
  def process_playlist
    Yt.configuration.api_key = Rails.application.secrets.youtube_api_key
    query_hash = Rack::Utils.parse_query URI(self.url).query
    if query_hash['list'].nil?
      errors.add(:url, "Not a valid playlist url")
      return false
    end
    
    playlist = Yt::Playlist.new(id: query_hash['list'])
    @title = playlist.title
    total_duration = Time.at(0)
    @videos = []
    playlist.playlist_items.each do |item|
      video = Yt::Video.new(id: item.video_id)
      @videos << { title: video.title, length: video.length }
      total_duration += video.duration
    end
    @total_duration = total_duration.strftime("%H:%M:%S")
  end
  
end