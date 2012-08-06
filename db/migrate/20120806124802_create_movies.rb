class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :added_by, :class => User
      t.integer :imdb_id
      t.string :title
      t.string :director
      t.integer :length
      t.string :mpaa_rating
      t.text :plot
      t.string :poster_url
      t.decimal :imdb_rating
      t.string :trailer_url
      t.integer :year
      t.integer :imdb_votes_count

      t.timestamps
    end
  end
end
