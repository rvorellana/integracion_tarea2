class ChangeMarkUpToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column Track, :duration, :float
  end
end
