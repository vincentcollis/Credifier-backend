class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :source, :image_url, :reporter, :topic, :title, :date, :reviews, :users

  def reviews
  end
  # has_many :reviews
  # has_many :users
end
