class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :best_director_oscars
      t.boolean :multiple_best_director_nominations

      t.timestamps 
    end
  end
end
