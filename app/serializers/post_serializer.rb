class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :source, :image_url, :reporter, :topic, :title, :date, :id

  attributes :custom_reviews do |object|
    object.reviews.map do |review|
      { id: review.id,
        review_rating: review.review_rating,
        user_id: review.user_id,
        text: review.text,
        post_id: review.post_id
      
    
    }
    end 
  end 

  attributes :custom_users do |object|
    
    object.users.map do |user|
      
    { id: user.id,
      user_ranking: user.ranking,
      image_url: user.image_url,
      username: user.username
    }
    end 

  end 
    
  # has_many :reviews
  # has_many :users
end
