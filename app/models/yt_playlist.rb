class YtPlaylist
  include ActiveModel::Model
  
  attr_accessor :url
  
  def process_playlist
    query_hash = Rack::Utils.parse_query URI(self.url).query
    if query_hash[:list].nil?
      errors.add(:url, "Not a valid playlist url")
      return false
    end
  end
end