class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.split.collect{|s| s.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    genre_name = slug.split("-").collect{|s| s.capitalize}.join(" ")
    self.find_by(name: genre_name)
  end
end
