class CreateFilmss < ActiveRecord::Migration[5.2]
  def change
    create_table :filmsses do |t|
      t.string :name
      t.integer :release_year
      t.integer :running_time
      t.boolean :best_picture_oscar
      t.references :director, foreign_key: true

      t.timestamps 
    end
  end
end
