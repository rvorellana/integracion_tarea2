class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, dependent: :destroy

  def encodealbum
    @string = "#{artist.name}:#{self.name}"
    @string = Base64.encode64(@string).gsub("\n", '')
    @string = @string[0,22]
    return @string
  end

  def index(host)
    @eartist = artist.eartist
    @url_artist = "#{host}/artists/#{@eartist}"
    @url_self = "#{host}/albums/#{ealbum}"
    @album_dict = {name: name, genre: genre, artist: "#{@url_artist}", tracks: "#{@url_self}/tracks", self: "#{@url_self}"}
    return @album_dict
  end

end
