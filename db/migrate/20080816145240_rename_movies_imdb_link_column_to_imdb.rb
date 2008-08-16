class RenameMoviesImdbLinkColumnToImdb < ActiveRecord::Migration
  def self.up
    rename_column :movies, :imdb_link, :imdb_id
  end

  def self.down
    rename_column :movies, :imdb_id, :imdb_link
  end
end
