class ChangeMoviesImdbIdToString < ActiveRecord::Migration
  def up
    change_column :movies, :imdb_id, :string, :null => false
  end

  def down
    change_column :movies, :imdb_id, :integer
  end
end
