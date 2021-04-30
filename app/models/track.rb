class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist

  def encodetrack
    @string = "#{album.name}:#{self.name}"
    @string = Base64.encode64(@string).gsub("\n", '')
    @string = @string[0,22]
    return @string
  end

  def index(host)
    @eartist = artist.eartist
    @ealbum = album.ealbum
    @url_artist = "#{host}/artists/#{@eartist}"
    @url_self = "#{host}/tracks/#{etrack}"
    @url_album = "#{host}/albums/#{@ealbum}"
    @track_dict = {name: name, duration: duration, times_played: times_played, artist: "#{@url_artist}", album: "#{@url_album}", self: "#{@url_self}"}
    return @track_dict
  end

  def play
    new_params = {times_played: times_played+1}
    self.update(new_params)
  end

end
