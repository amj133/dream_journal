class AddTitleToDreams < ActiveRecord::Migration[5.1]
  def change
    add_column :dreams, :title, :string
  end
end
