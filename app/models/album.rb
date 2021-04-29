class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, dependent: :destroy
  has_many :albums, dependent: :destroy
  validates :name, :genre, presence: true

  def encodealbum
    @string = Base64.encode64(self.name).gsub("\n", '')
    if @string.length > 22
      @string = @string[0,22]
    end
    self.ealbum  = @string
  end

  def index(host)
    @eartist = artist.eartist
    @url_artist = "https://#{host}/artists/#{@eartist}"
    @url_self = "https://#{host}/albums/#{ealbum}"
    @album_dict = {name: name, genre: genre, artist: "#{@url_artist}", tracks: "#{@url_self}/tracks", self: "#{@url_self}"}
    return @album_dict
  end

end
