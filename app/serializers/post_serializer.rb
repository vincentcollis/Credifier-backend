class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :source, :image_url, :reporter, :topic, :title, :date, :reviews, :users, :id

  attributes :custom_reviews do |object|
    object.reviews.map do |review|
      {
    review_rating: review.review_rating}
    end 

  end 
    
  # has_many :reviews
  # has_many :users
end
