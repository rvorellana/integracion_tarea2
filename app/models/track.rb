class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist

  def encodetrack
    @string = Base64.encode64(self.name).gsub("\n", '')
    if @string.length > 22
      @string = @string[0,22]
    end
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
