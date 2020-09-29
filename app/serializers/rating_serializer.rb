class RatingSerializer 
  include FastJsonapi::ObjectSerializer
  attributes  :score, :review, :rater


  # belongs_to :review
  # belongs_to :rater
end
