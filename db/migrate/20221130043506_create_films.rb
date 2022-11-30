class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.integer :release_year
      t.integer :running_time
      t.boolean :best_picture_oscar
      t.references :director, foreign_key: true
    end
  end
end
