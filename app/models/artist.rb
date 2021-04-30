class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :tracks, dependent: :destroy

  def encodeartist
    @string = Base64.encode64(self.name).gsub("\n", '')
    @string = @string.truncate(22)
    return @string
  end

  def index(host)
    @url = "#{host}/artists/#{eartist}"
    @artist_dict = {name: name, age: age, albums: "#{@url}/albums", tracks: "#{@url}/tracks", self: "#{@url}"}
    return @artist_dict
  end
end
