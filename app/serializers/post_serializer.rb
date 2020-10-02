class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :source, :image_url, :reporter, :topic, :title, :date, :users, :id

  attributes :reviews do |object|
    object.reviews.reverse()
  end 
  attributes :custom_reviews do |object|
    reviews_arr = []
    object.reviews.map do |review|
      reviews_arr << review.review_rating
    end 
    reviews_arr.reverse()
  end 

  attributes :user_rankings do |object|
    ranking_arr = []
    object.users.map do |user|
      
    ranking_arr << [user.ranking]
    end 
    ranking_arr

  end 
    
  # has_many :reviews
  # has_many :users
end
