class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, dependent: :destroy

  def encodealbum
    @string = Base64.encode64(self.name).gsub("\n", '')
    if @string.length > 22
      @string = @string[0,22]
    end
    self.ealbum  = @string
  end
end
