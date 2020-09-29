class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  
  attribute :text, :ratings

  belongs_to :user
  belongs_to :post

  # has_many :ratings
end
