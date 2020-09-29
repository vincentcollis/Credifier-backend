class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  
  attribute :text, :ratings, :user, :post

  # belongs_to :user
  # belongs_to :post

  # has_many :ratings
end
