class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :username, :name, :ranking, :image_url

  has_many :posts
  has_many :ratings
  has_many :raters

end
