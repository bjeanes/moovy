class ImdbMovie
  attr_accessor :imdb_id, :title, :directors, :writers, :tagline, :company, :plot, :runtime, :rating, :poster_url, :release_date, :genres

  def writers
     @writers || []
  end

  def directors
    @directors || []
  end
  
  def genres
    @genres || []
  end

end
