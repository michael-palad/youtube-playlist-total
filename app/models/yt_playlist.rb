class YtPlaylist
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :url
  
  attr_reader :title
  attr_reader :videos
  attr_reader :total_duration
  
  validates_url :url, message: "Please enter a valid url"
  
  def process_playlist
    begin
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
        begin
          video = Yt::Video.new(id: item.video_id)
          @videos << { id: video.id, title: video.title, length: video.length,
                       thumbnail_url: video.thumbnail_url }
        rescue
          next  # for deleted and invalid videos
        end
        total_duration += video.duration
      end
      
      if total_duration.day > 1
        @total_duration = "#{pluralize(total_duration.day - 1 , "day")} and "
        @total_duration += total_duration.strftime("%H:%M:%S")
      else
        @total_duration = total_duration.strftime("%H:%M:%S")
      end
    rescue
      errors.add(:url, "Error retrieving playlist data")
      return false
    end
    
    return true
  end
  
end