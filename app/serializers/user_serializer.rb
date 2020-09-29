class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :username, :name, :ranking, :image_url, :reviews, :ratings, :posts, :raters

  has_many :reviews  
  has_many :posts
  has_many :ratings
  has_many :raters
end


