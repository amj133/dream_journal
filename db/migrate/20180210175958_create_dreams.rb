class CreateDreams < ActiveRecord::Migration[5.1]
  def change
    create_table :dreams do |t|
      t.text :body
      t.text :analysis
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
