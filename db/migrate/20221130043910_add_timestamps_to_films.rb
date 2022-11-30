class AddTimestampsToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films,:created_at, :datetime, null: false
    add_column :films,:updated_at, :datetime, null: false
  end
end
