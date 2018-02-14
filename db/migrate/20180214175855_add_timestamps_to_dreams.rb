class AddTimestampsToDreams < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:dreams, null: false)
  end
end
