class ChangeMarkUpToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column Track, :times_played, :integer
  end
end
