class CreateDreamCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :dream_categories do |t|
      t.references :dream, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
