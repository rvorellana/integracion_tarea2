class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist

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
    @url_album = "https://#{host}/albums/#{@ealbum}"
    @track_dict = {name: name, duration: duration, times_played: times_played, artist: "#{@url_artist}", album: "#{@url_album}", self: "#{@url_self}"}
    return @track_dict
  end

  def play
    self.times_played += 1
  end

end
