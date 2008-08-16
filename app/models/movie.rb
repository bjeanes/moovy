class Movie < ActiveRecord::Base
  belongs_to :disk
  
  def self.search(terms)
    if terms
      find(:all, :conditions => ['title LIKE ?', "%#{terms}%"])
    else
      find(:all)
    end
  end
  
  def disk_label=(label)
    self.disk = Disk.find_or_create_by_label(label)
  end
  
  def disk_label
    self.disk.label
  rescue
    nil
  end
  
  def to_param
    "#{id}-#{title.gsub(/[^a-zA-Z0-9]+/,'-')}"
  end
  
  # IMDB stuff
  def genres
    imdb.genres.collect{|g| g.name}
  rescue
    []
  end
  
  private
  def imdb
    @imdb ||= Imdb.find_
    movie_by_id(self.imdb_link)
  end
end
