class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  def encodeartist
    @string = Base64.encode64(self.name).gsub("\n", '')
    if @string.length > 22
      @string = @string[0,22]
    end
    self.eartist  = @string
  end

  def output
    @artist_dict = {name: name, age: age, albums: "artists"}
  end
end
