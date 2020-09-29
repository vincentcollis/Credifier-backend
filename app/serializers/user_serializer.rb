class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :my_score
  attributes :username, :name, :ranking, :image_url, :reviews, :ratings, :posts, :raters
  
  #  set_type :author
  # has_many :reviews  
  # has_many :posts
  # has_many :ratings
  # has_many :raters
end


