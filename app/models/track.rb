class Track < ApplicationRecord
  belongs_to :album
  validates :name, :duration, presence: true
  validates :duration, numericality: {only_float: true}

  def encodetrack
    @string = Base64.encode64(self.name).gsub("\n", '')
    if @string.length > 22
      @string = @string[0,22]
    end
    self.etrack  = @string
  end

  def index(host)
    @eartist = album.artist.eartist
    @ealbum = album.ealbum
    @url_artist = "https://#{host}/artists/#{@eartist}"
    @url_self = "https://#{host}/tracks/#{etrack}"
    @url_album = "https://#{host}/albums/#{ealbums}"
    @track_dict = {name: name, duration: duration, times_played: times_played, artist: "#{@url_artist}", albums: "#{@url_album}", self: "#{@url_self}"}
    return @track_dict
  end

end
