class RemoveRunTimeFromFilms < ActiveRecord::Migration[5.2]
  def change
    remove_column :films, :running_time, :integer
  end
end
